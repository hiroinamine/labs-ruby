# Chamada http
# GET
require 'net/http'
example = Net::HTTP.get('example.com', '/index.html')
File.open('example.html', 'w') do |file|
    file.puts(example)
end
puts '-' * 5

# HTTPS
https = Net::HTTP.new('reqres.in', 443)
https.use_ssl = true

response = https.get("/api/users")
puts response.code
puts response.message
puts response.body
puts '-' * 5

# POST
uri = URI("https://reqres.in/api/users")
req = Net::HTTP::Post.new(uri)
req.set_form_data({ name: 'Mario', job: 'Encanador' })
response2 = Net::HTTP.start(uri.hostname, use_ssl: true) do |my_https|
    my_https.request(req)
end
puts response2.code
puts response2.message
puts response2.body
puts '-' * 5