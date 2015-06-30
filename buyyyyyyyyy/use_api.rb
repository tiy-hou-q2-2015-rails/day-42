require 'http'
host = "http://localhost:3000"

response = Http.with_headers("x-api-key" => "61b9ec53")
               .get("#{host}/api/products.json")
products = JSON.parse(response)

puts "Code: #{response.code}"
puts products.inspect
