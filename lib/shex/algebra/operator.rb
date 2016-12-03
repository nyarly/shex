require 'sparql/algebra'
require 'sparql/extensions'

module ShEx::Algebra

  ##
  # The ShEx operator.
  #
  # @abstract
  class Operator
    extend SPARQL::Algebra::Expression

    # Location of schema including this operator
    attr_accessor :schema

    ##
    # Returns an operator class for the given operator `name`.
    #
    # @param  [Symbol, #to_s]  name
    # @param  [Integer] arity
    # @return [Class] an operator class, or `nil` if an operator was not found
    def self.for(name, arity = nil)
      {
        and: And,
        annotation: Annotation,
        base: Base,
        inclusion: Inclusion,
        nodeConstraint: NodeConstraint,
        not: Not,
        or: Or,
        prefix: Prefix,
        schema: Schema,
        semact: SemAct,
        shape_external: ShapeExternal,
        shape_ref: ShapeRef,
        shape: Shape,
        start: Start,
        stem: Stem,
        stemRange: StemRange,
        tripleConstraint: TripleConstraint,
        unaryShape: UnaryShape,
        value: Value,
      }.fetch(name.to_s.downcase.to_sym)
    end

    ##
    # Returns the arity of this operator class.
    #
    # @example
    #   Operator.arity           #=> -1
    #   Operator::Nullary.arity  #=> 0
    #   Operator::Unary.arity    #=> 1
    #   Operator::Binary.arity   #=> 2
    #   Operator::Ternary.arity  #=> 3
    #
    # @return [Integer] an integer in the range `(-1..3)`
    def self.arity
      self.const_get(:ARITY)
    end

    ARITY = -1 # variable arity

    ##
    # Initializes a new operator instance.
    #
    # @overload initialize(*operands)
    #   @param  [Array<RDF::Term>] operands
    #
    # @overload initialize(*operands, options)
    #   @param  [Array<RDF::Term>] operands
    #   @param  [Hash{Symbol => Object}] options
    #     any additional options
    #   @option options [Boolean] :memoize (false)
    #     whether to memoize results for particular operands
    # @raise  [TypeError] if any operand is invalid
    def initialize(*operands)
      @options  = operands.last.is_a?(Hash) ? operands.pop.dup : {}
      @operands = operands.map! do |operand|
        case operand
          when Array
            operand.each {|op| op.parent = self if operand.respond_to?(:parent=)}
            operand
          when Operator, RDF::Term, RDF::Query, RDF::Query::Pattern, Array, Symbol
            operand.parent = self if operand.respond_to?(:parent=)
            operand
          when TrueClass, FalseClass, Numeric, String, DateTime, Date, Time
            RDF::Literal(operand)
          when NilClass
            raise ShEx::OperandError, "Found nil operand for #{self.class.name}"
            nil
          else raise TypeError, "invalid SPARQL::Algebra::Operator operand: #{operand.inspect}"
        end
      end
    end

    ##
    # Base URI used for reading data sources with relative URIs
    #
    # @return [RDF::URI]
    def base_uri
      Operator.base_uri
    end

    ##
    # Base URI used for reading data sources with relative URIs
    #
    # @return [RDF::URI]
    def self.base_uri
      @base_uri
    end

    ##
    # Set Base URI associated with SPARQL document, typically done
    # when reading SPARQL from a URI
    #
    # @param [RDF::URI] uri
    # @return [RDF::URI]
    def self.base_uri=(uri)
      @base_uri = RDF::URI(uri)
    end

    ##
    # Prefixes useful for future serialization
    #
    # @return [Hash{Symbol => RDF::URI}]
    #   Prefix definitions
    def prefixes
      Operator.prefixes
    end

    ##
    # Prefixes useful for future serialization
    #
    # @return [Hash{Symbol => RDF::URI}]
    #   Prefix definitions
    def self.prefixes
      @prefixes
    end

    ##
    # Prefixes useful for future serialization
    #
    # @param [Hash{Symbol => RDF::URI}] hash
    #   Prefix definitions
    # @return [Hash{Symbol => RDF::URI}]
    def self.prefixes=(hash)
      @prefixes = hash
    end

    ##
    # The operands to this operator.
    #
    # @return [Array]
    attr_reader :operands

    ##
    # Returns the operand at the given `index`.
    #
    # @param  [Integer] index
    #   an operand index in the range `(0...(operands.count))`
    # @return [RDF::Term]
    def operand(index = 0)
      operands[index]
    end

    ##
    # Returns the SPARQL S-Expression (SSE) representation of this operator.
    #
    # @return [Array]
    # @see    http://openjena.org/wiki/SSE
    def to_sxp_bin
      operator = [self.class.const_get(:NAME)].flatten.first
      [operator, *(operands || []).map(&:to_sxp_bin)]
    end

    ##
    # Returns an S-Expression (SXP) representation of this operator
    #
    # @return [String]
    def to_sxp
      begin
        require 'sxp' # @see http://rubygems.org/gems/sxp
      rescue LoadError
        abort "SPARQL::Algebra::Operator#to_sxp requires the SXP gem (hint: `gem install sxp')."
      end
      require 'sparql/algebra/sxp_extensions'

      to_sxp_bin.to_sxp
    end

    ##
    # Returns a developer-friendly representation of this operator.
    #
    # @return [String]
    def inspect
      sprintf("#<%s:%#0x(%s)>", self.class.name, __id__, operands.to_sse.gsub(/\s+/m, ' '))
    end

    ##
    # @param  [Statement] other
    # @return [Boolean]
    def eql?(other)
      other.class == self.class && other.operands == self.operands
    end
    alias_method :==, :eql?

    ##
    # Enumerate via depth-first recursive descent over operands, yielding each operator
    # @yield operator
    # @yieldparam [Object] operator
    # @return [Enumerator]
    def each_descendant(&block)
      if block_given?
        operands.each do |operand|
          case operand
          when Array
            operand.each do |op|
              op.each_descendant(&block) if op.respond_to?(:each_descendant)
              block.call(op)
            end
          else
            operand.each_descendant(&block) if operand.respond_to?(:each_descendant)
          end
          block.call(operand)
        end
      end
      enum_for(:each_descendant)
    end
    alias_method :descendants, :each_descendant
    alias_method :each, :each_descendant

    ##
    # Parent expression, if any
    #
    # @return [Operator]
    def parent; @options[:parent]; end

    ##
    # Parent operator, if any
    #
    # @return [Operator]
    def parent=(operator)
      @options[:parent]= operator
    end

    ##
    # First ancestor operator of type `klass`
    #
    # @param [Class] klass
    # @return [Operator]
    def first_ancestor(klass)
      parent.is_a?(klass) ? parent : parent.first_ancestor(klass) if parent
    end

    ##
    # Validate all operands, operator specific classes should override for operator-specific validation
    # @return [SPARQL::Algebra::Expression] `self`
    # @raise  [ArgumentError] if the value is invalid
    def validate!
      operands.each {|op| op.validate! if op.respond_to?(:validate!)}
      self
    end

    ##
    # A unary operator.
    #
    # Operators of this kind take one operand.
    #
    # @abstract
    class Unary < Operator
      ARITY = 1

      ##
      # @param  [RDF::Term] arg1
      #   the first operand
      # @param  [RDF::Term] arg2
      #   the second operand
      # @param  [Hash{Symbol => Object}] options
      #   any additional options (see {Operator#initialize})
      def initialize(arg1, options = {})
        super
      end
    end # Unary

    ##
    # A binary operator.
    #
    # Operators of this kind take two operands.
    #
    # @abstract
    class Binary < Operator
      ARITY = 2

      ##
      # @param  [RDF::Term] arg1
      #   the first operand
      # @param  [RDF::Term] arg2
      #   the second operand
      # @param  [Hash{Symbol => Object}] options
      #   any additional options (see {Operator#initialize})
      def initialize(arg1, arg2, options = {})
        super
      end
    end # Binary
  end
end