require 'rubygems'
require 'sparql'
require 'rdf/turtle'

queryable = RDF::Repository.load("etc/recipe.ttl")
query = SPARQL.parse("SELECT * WHERE { ?s ?p ?o }")

results = []

queryable.query(query) do |result|
  results << result
end

results
