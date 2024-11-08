require 'rubygems'
require 'sparql'
require 'rdf/turtle'

query = "
  SELECT ?s ?p ?o
  WHERE {
    ?s ?p ?o.
  }
  LIMIT 10
"

repository = RDF::Repository.load("etc/users.ttl")
client = SPARQL::Client.new(repository)

results = client.query(query)

results.to_json
