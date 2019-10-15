# Blocks
# funcao anonima - conjunto de instruções passado

# com unica linha dentro de colchetes
3.times { puts "Exec the block"}
puts '------'

sum = 0
numbers = [5, 10, 5]
numbers.each {
    |number| sum += number
    puts sum
    puts 'hi'
}
puts sum
puts '------'

# com mais de uma instrução usando do .. end
foo = {2 => 3, 4 => 5}
foo.each do |key, value|
    puts "key = #{key}"
    puts "value = #{value}"
    puts "-"
end
puts '------'

# passar block como parametro, um bloco por metodo
def foo
    if block_given?
        yield
    else
        puts "Sem parametro do tipo bloco"
    end
end
foo { puts "Exec the block" }
foo
puts '------'

# como se fosse injetado o bloco dentro do metodo
def foo(name, &block)
    @name = name
    block.call
end
foo('leonardo') {puts "hello #{@name}"}
puts '------'

# block com parametro
def foo(numbers, &block)
    numbers.each do |key, value|
        block.call(key, value)
    end
end
numbers = {2 => 'dois', 3 => 'tres'}
foo(numbers) do |key, value|
    puts "#{key} => #{value}"
end
