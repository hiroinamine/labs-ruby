# collections
# Array
states = []
states.push('Espirito Santo')
states.push('Minas Gerais', 'Rio Grande ao Sul', 'Sao Paulo')
states.insert(0, 'Acre', 'Amapa')
states[4] = 'Rio Grande do Sul'
puts "#{states}"
puts "intervalo #{states[1..2]}"
states[-1] # pegar de tras pra frente
states.count
states.first
states.last
states.empty?
states.include?('Sao Paulo')
states.delete_at(2)
states.pop # remove o ultimo
states.shift # remove o primeiro
puts "#{states}"
puts '-----------'

# Hash
capitals = {} # ou `Hash.new`
capitals = { acre: 'Rio Branco', sao_paulo: 'Sao Paulo'}
capitals[:minas_gerais] = "Belo Horizonte" 
capitals.keys
capitals.values
capitals.delete(:acre)
capitals.size
capitals.empty?
puts "#{capitals}"
puts '-----------'

# iteraçoes
# each
names = ['john', 'ana', 'peter']
name = 'fulano'
names.each do |name| # `|name|` variavel de escopo local
    puts name
end
puts name


aulas = {'aula 1' => 'liberada', 'aula 2' => 'liberada', 'aula 3' => 'fechada'}
aulas.each do |key, value|
    puts "#{key} - #{value}"
end
puts '-----------'

# map
array = [1, 2, 3, 4]
new_array = array.map do |a|
    a * 2
end
puts " #{new_array}"

#`map!` funcao que sobreescreve a coleçao original
puts '-----------'

# select
array = [1, 2, 3, 4, 5, 6]
selection = array.select do |a|
    a >= 4
end
puts "#{selection}"

hash = {0 => 'zero', 1 => 'um', 2 => 'dois', 3 => 'tres'}
selection_key = hash.select do |key, value|
    key > 1
end
puts "#{selection_key}"