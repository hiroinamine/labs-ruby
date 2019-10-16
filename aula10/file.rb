# File

# Leitura de arquivo
file = File.open('shopping-list.txt')

file.each do |line|
    puts line
end

file.close

# Escrita de arquivo
File.open('shopping-list.txt', 'a') do |file|
    file.puts
    file.puts('arroz')
    file.puts('azeite')
end