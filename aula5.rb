# Metodos
def hello name
    puts "Ola #{name}"
end
hello "Flavia"

def talk(name, last_name)
    puts "Ola #{name} #{last_name}, como esta?"
end
name = 'leo'
last_name = 'souza'
talk(name, last_name)

def signal(color = 'vermelho', name) # parametro com valor default, se torna opcional
    puts "#{name}! O sinal esta #{color}"
end
signal('yellow', 'Maria')

def compare (a, b)
    a > b # pode utilizar tbm `return`
end
puts "#{compare(1, 2)}"
