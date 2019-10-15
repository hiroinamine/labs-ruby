# tipos de dados

myVar = 10 # tipagem dinamica
puts myVar.class
myVar = 10.10
puts myVar.class
myVar = true
puts myVar.class
myVar = "Ola mundo"
puts myVar.class
puts '-----------'

myArray = ["Ola mundo", "new", "world"]
puts myArray.class
puts myArray[2]
puts '-----------'

mySymbol = :ruby_symbol
puts mySymbol.class, mySymbol.object_id
mySecondSymbol = :ruby_symbol
puts mySymbol.object_id, mySecondSymbol.object_id
myS1 = "one"
myS2 = "two"
puts myS1.object_id, myS2.object_id
puts '-----------'

myHash = { course: 'ruby', language: 'pt-br', isNew: true }
puts myHash[:course]
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
