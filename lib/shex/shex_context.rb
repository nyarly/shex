# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically from http://shex.io/context.jsonld
require 'json/ld'
class JSON::LD::Context
  add_preloaded("http://shex.io/context.jsonld") do
    new(term_definitions: {
      "Annotation" => TermDefinition.new("Annotation", id: "http://www.w3.org/ns/shex#Annotation", simple: true),
      "EachOf" => TermDefinition.new("EachOf", id: "http://www.w3.org/ns/shex#EachOf", simple: true),
      "NodeConstraint" => TermDefinition.new("NodeConstraint", id: "http://www.w3.org/ns/shex#NodeConstraint", simple: true),
      "NodeKind" => TermDefinition.new("NodeKind", id: "http://www.w3.org/ns/shex#NodeKind", simple: true),
      "OneOf" => TermDefinition.new("OneOf", id: "http://www.w3.org/ns/shex#OneOf", simple: true),
      "Schema" => TermDefinition.new("Schema", id: "http://www.w3.org/ns/shex#Schema", simple: true),
      "SemAct" => TermDefinition.new("SemAct", id: "http://www.w3.org/ns/shex#SemAct", simple: true),
      "Shape" => TermDefinition.new("Shape", id: "http://www.w3.org/ns/shex#Shape", simple: true),
      "ShapeAnd" => TermDefinition.new("ShapeAnd", id: "http://www.w3.org/ns/shex#ShapeAnd", simple: true),
      "ShapeExpression" => TermDefinition.new("ShapeExpression", id: "http://www.w3.org/ns/shex#ShapeExpression", simple: true),
      "ShapeExternal" => TermDefinition.new("ShapeExternal", id: "http://www.w3.org/ns/shex#ShapeExternal", simple: true),
      "ShapeNot" => TermDefinition.new("ShapeNot", id: "http://www.w3.org/ns/shex#ShapeNot", simple: true),
      "ShapeOr" => TermDefinition.new("ShapeOr", id: "http://www.w3.org/ns/shex#ShapeOr", simple: true),
      "Stem" => TermDefinition.new("Stem", id: "http://www.w3.org/ns/shex#Stem", simple: true),
      "StemRange" => TermDefinition.new("StemRange", id: "http://www.w3.org/ns/shex#StemRange", simple: true),
      "TripleConstraint" => TermDefinition.new("TripleConstraint", id: "http://www.w3.org/ns/shex#TripleConstraint", simple: true),
      "TripleExpression" => TermDefinition.new("TripleExpression", id: "http://www.w3.org/ns/shex#TripleExpression", simple: true),
      "Wildcard" => TermDefinition.new("Wildcard", id: "http://www.w3.org/ns/shex#Wildcard", simple: true),
      "annotation" => TermDefinition.new("annotation", id: "http://www.w3.org/ns/shex#annotation", type_mapping: "@id"),
      "annotations" => TermDefinition.new("annotations", id: "http://www.w3.org/ns/shex#annotation", type_mapping: "@id"),
      "bnode" => TermDefinition.new("bnode", id: "http://www.w3.org/ns/shex#bnode", simple: true),
      "closed" => TermDefinition.new("closed", id: "http://www.w3.org/ns/shex#closed", type_mapping: "http://www.w3.org/2001/XMLSchema#boolean"),
      "code" => TermDefinition.new("code", id: "http://www.w3.org/ns/shex#code"),
      "datatype" => TermDefinition.new("datatype", id: "http://www.w3.org/ns/shex#datatype", type_mapping: "@id"),
      "exclusion" => TermDefinition.new("exclusion", id: "http://www.w3.org/ns/shex#exclusion", type_mapping: "@id"),
      "exclusions" => TermDefinition.new("exclusions", id: "http://www.w3.org/ns/shex#exclusion", type_mapping: "@id"),
      "expression" => TermDefinition.new("expression", id: "http://www.w3.org/ns/shex#expression", type_mapping: "@id"),
      "expressions" => TermDefinition.new("expressions", id: "http://www.w3.org/ns/shex#expressions", type_mapping: "@id", container_mapping: "@list"),
      "extra" => TermDefinition.new("extra", id: "http://www.w3.org/ns/shex#extra", type_mapping: "@id"),
      "fractiondigits" => TermDefinition.new("fractiondigits", id: "http://www.w3.org/ns/shex#fractiondigits", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "id" => TermDefinition.new("id", id: "@id", simple: true),
      "inverse" => TermDefinition.new("inverse", id: "http://www.w3.org/ns/shex#inverse", type_mapping: "http://www.w3.org/2001/XMLSchema#boolean"),
      "iri" => TermDefinition.new("iri", id: "http://www.w3.org/ns/shex#iri", simple: true),
      "language" => TermDefinition.new("language", id: "@language", simple: true),
      "length" => TermDefinition.new("length", id: "http://www.w3.org/ns/shex#length", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "literal" => TermDefinition.new("literal", id: "http://www.w3.org/ns/shex#literal", simple: true),
      "max" => TermDefinition.new("max", id: "http://www.w3.org/ns/shex#max", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "maxexclusive" => TermDefinition.new("maxexclusive", id: "http://www.w3.org/ns/shex#maxexclusive", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "maxinclusive" => TermDefinition.new("maxinclusive", id: "http://www.w3.org/ns/shex#maxinclusive", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "maxlength" => TermDefinition.new("maxlength", id: "http://www.w3.org/ns/shex#maxlength", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "min" => TermDefinition.new("min", id: "http://www.w3.org/ns/shex#min", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "minexclusive" => TermDefinition.new("minexclusive", id: "http://www.w3.org/ns/shex#minexclusive", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "mininclusive" => TermDefinition.new("mininclusive", id: "http://www.w3.org/ns/shex#mininclusive", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "minlength" => TermDefinition.new("minlength", id: "http://www.w3.org/ns/shex#minlength", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "name" => TermDefinition.new("name", id: "http://www.w3.org/ns/shex#name", type_mapping: "@id"),
      "nodeKind" => TermDefinition.new("nodeKind", id: "http://www.w3.org/ns/shex#nodeKind", type_mapping: "@vocab"),
      "nonliteral" => TermDefinition.new("nonliteral", id: "http://www.w3.org/ns/shex#nonliteral", simple: true),
      "numericFacet" => TermDefinition.new("numericFacet", id: "http://www.w3.org/ns/shex#numericFacet"),
      "object" => TermDefinition.new("object", id: "http://www.w3.org/ns/shex#object", type_mapping: "@id"),
      "pattern" => TermDefinition.new("pattern", id: "http://www.w3.org/ns/shex#pattern"),
      "predicate" => TermDefinition.new("predicate", id: "http://www.w3.org/ns/shex#predicate", type_mapping: "@id"),
      "rdf" => TermDefinition.new("rdf", id: "http://www.w3.org/1999/02/22-rdf-syntax-ns#", simple: true),
      "rdfs" => TermDefinition.new("rdfs", id: "http://www.w3.org/2000/01/rdf-schema#", simple: true),
      "semActs" => TermDefinition.new("semActs", id: "http://www.w3.org/ns/shex#semActs", type_mapping: "@id", container_mapping: "@list"),
      "shapeExpr" => TermDefinition.new("shapeExpr", id: "http://www.w3.org/ns/shex#shapeExpr", type_mapping: "@id"),
      "shapeExprs" => TermDefinition.new("shapeExprs", id: "http://www.w3.org/ns/shex#shapeExprs", type_mapping: "@id", container_mapping: "@list"),
      "shapes" => TermDefinition.new("shapes", id: "http://www.w3.org/ns/shex#shapes", type_mapping: "@id"),
      "shex" => TermDefinition.new("shex", id: "http://www.w3.org/ns/shex#", simple: true),
      "start" => TermDefinition.new("start", id: "http://www.w3.org/ns/shex#start", type_mapping: "@id"),
      "startActs" => TermDefinition.new("startActs", id: "http://www.w3.org/ns/shex#startActs", type_mapping: "@id", container_mapping: "@list"),
      "stem" => TermDefinition.new("stem", id: "http://www.w3.org/ns/shex#stem", type_mapping: "http://www.w3.org/2001/XMLSchema#anyUri"),
      "stringFacet" => TermDefinition.new("stringFacet", id: "http://www.w3.org/ns/shex#stringFacet"),
      "totaldigits" => TermDefinition.new("totaldigits", id: "http://www.w3.org/ns/shex#totaldigits", type_mapping: "http://www.w3.org/2001/XMLSchema#integer"),
      "type" => TermDefinition.new("type", id: "@type", simple: true),
      "uri" => TermDefinition.new("uri", id: "@id", simple: true),
      "value" => TermDefinition.new("value", id: "@value", simple: true),
      "valueExpr" => TermDefinition.new("valueExpr", id: "http://www.w3.org/ns/shex#valueExpr", type_mapping: "@id"),
      "values" => TermDefinition.new("values", id: "http://www.w3.org/ns/shex#values", type_mapping: "@id", container_mapping: "@list"),
      "xsFacet" => TermDefinition.new("xsFacet", id: "http://www.w3.org/ns/shex#xsFacet"),
      "xsd" => TermDefinition.new("xsd", id: "http://www.w3.org/2001/XMLSchema#", simple: true)
    })
  end
end
