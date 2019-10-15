# Lambda
# semelhante a block mas podem ser salvas em variaveis
first_lambda = lambda { puts "my first lamda" } # pode substituir `lambda` por `->` se for uma unica linha
first_lambda.call
puts '-----'

# lambda com parametro
my_lambda = -> (names) { names.each { |name| puts name } }
names = ['j', 'k', 'l']
my_lambda.call(names)
puts '-----'

second_lambda = -> (numbers) {
    index = 0
    puts 'Numero atual + proximo numero'
    numbers.each do |number|
        return if numbers[index] == numbers.last
        puts "#{numbers[index]} + #{numbers[index + 1]} = #{numbers[index] + numbers[index + 1]}"
        index += 1
    end
}

second_lambda.call([1,2,3])
puts '-----'

# lambda como parametro
def foo(first_lambda, second_lambda)
    first_lambda.call
    second_lambda.call
end
first_lambda = -> { puts 'first lambda'}
second_lambda = -> { puts 'second lambda'}
foo(first_lambda, second_lambda)
puts '-----'