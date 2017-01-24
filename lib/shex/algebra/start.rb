module ShEx::Algebra
  ##
  class Start < Operator::Unary
    include ShapeExpression
    NAME = :start

    #
    # @param  (see ShapeExpression#satisfies?)
    # @return (see ShapeExpression#satisfies?)
    # @raise  (see ShapeExpression#satisfies?)
    def satisfies?(focus, depth: 0)
      status "", depth: depth
      matched_op = operands.first.satisfies?(focus, depth: depth + 1)
      satisfy focus: focus, satisfied: matched_op, depth: depth
    rescue ShEx::NotSatisfied => e
      not_satisfied e.message, focus: focus, unsatisfied: e.expression, depth: depth
      raise
    end
  end
end
