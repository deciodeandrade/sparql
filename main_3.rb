require 'rubygems'
require 'sparql/client'
require 'rdf'
require 'sparql'
require 'rdf/turtle'
require 'rdf/vocab' 

# Simulação de dados de usuários
users = [
  { id: 1, name: "Alice", email: "alice@example.com" },
  { id: 2, name: "Bob", email: "bob@example.com" },
  { id: 3, name: "Charlie", email: "charlie@example.com" }
]

# Cria o grafo RDF
graph = RDF::Graph.new

# Adiciona cada usuário como um recurso RDF no grafo
users.each do |user|
  user_uri = RDF::URI("http://example.org/user/#{user[:id]}")
  graph << [user_uri, RDF::Vocab::FOAF.name, user[:name]]
  graph << [user_uri, RDF::Vocab::FOAF.mbox, user[:email]]
end

# Defina a consulta SPARQL
query = "
  SELECT ?s ?p ?o
  WHERE {
    ?s ?p ?o.
  }
  LIMIT 10
"

# Executa a consulta no grafo
client = SPARQL::Client.new(graph)
results = client.query(query)

# Exibe os resultados
results
