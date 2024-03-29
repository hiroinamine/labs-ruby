# Web Scraping - extrair dados de sites
# gem install nokogiri
require 'nokogiri'
require 'net/http'

https = Net::HTTP.new('onebitcode.com', 443)
https.use_ssl = true

response = https.get('/')

doc = Nokogiri::HTML(response.body)

h1 = doc.at('h1')
puts h1.content
puts h1
puts '-' * 5

last_post = doc.at('h3 a')
puts last_post.content
puts last_post['href']
puts '-' * 5

doc.search('h3 a').each do |a|
    puts a.content
    puts a['href']
    puts ''
end
puts '-' * 5