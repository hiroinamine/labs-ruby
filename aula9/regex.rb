# Regex
/abcd/ # mais comum
%r{abcd}
Regexp.new('abcd')

# indice do padrao encontrado
puts /by/ =~ 'ru ruby'
puts '-' * 5

# match
phrase = "Hello, how are you"
match_data = /how/.match(phrase)
puts match_data.pre_match, match_data.post_match
puts '-' * 5

# escape \?
puts /\?/.match('Tudo bem?')

puts /\d{2}-\d{8,9}$/.match('11-910005000')