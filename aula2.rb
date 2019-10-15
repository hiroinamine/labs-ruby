# tipos de dados

my_var = 10 # tipagem dinamica
puts my_var.class
my_var = 10.10
puts my_var.class
my_var = true
puts my_var.class
my_var = "Ola mundo"
puts my_var.class
puts '-----------'

my_array = ["Ola mundo", "new", "world"]
puts my_array.class
puts my_array[2]
puts '-----------'

my_symbol = :ruby_symbol
puts my_symbol.class, my_symbol.object_id
mySecondSymbol = :ruby_symbol
puts my_symbol.object_id, mySecondSymbol.object_id
myS1 = "one"
myS2 = "two"
puts myS1.object_id, myS2.object_id
puts '-----------'

my_hash = { course: 'ruby', language: 'pt-br', isNew: true }
puts my_hash[:course]
puts '-----------'

# operadores matematicos
var1 = 10
var2 = 4
var1 + var2
var1 - var2
var1 * var2
var1 / var2
puts  var1 % var2 # modulo
var1 ** var2 # exponencial
puts '-----------'

# I/O
print 'Digite seu nome: ' # diferente do puts, o print não quebra linha
name = gets.chomp
print 'Digite seu sobrenome: '
lastname = gets.chomp
puts "Hello #{name} #{lastname}!"
puts '-----------'

# programa para soma de dois numeros
print 'Digite um numero: '
number1 = gets.chomp.to_i
print 'Digite outro numero: '
number2 = gets.chomp.to_i
puts "Resultado da soma dos dois numeros é: #{number1 + number2}"
