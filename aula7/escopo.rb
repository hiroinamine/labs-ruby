# Escopo de variaveis

# boas praticas
# local - inicial com primeira letra minuscula ou sublinhado
# global - prefixo $
# variavel de classe - prefixo @@
# variavel de instancia - prefixo @

# Local
def foo
    local = 'variavel acessada localmente'
    print local
end
puts '-----'

# Global - nao recomendado o uso
class Bar
    def foo
        $global = 0
        puts $global
    end
end

class Baz
    def qoo
        $global += 1
        puts $global
    end
end

bar = Bar.new
baz = Baz.new
bar.foo
$global = 5
baz.qoo
puts '-----'

# Variavel de classe
class User
    @@user_count = 0
    def add(name)
        puts "User #{name} adicionado"
        @@user_count += 1
        puts @@user_count
    end
end
first = User.new
first.add('Joao')
second= User.new
second.add('Mario')
puts '-----'

# Variavel de instancia
class Other
    def add(name)
        @name = name
        puts "user adicionado"
        hello
    end

    def hello
        puts "Seja bem vindo, #{@name}"
    end
end

user = Other.new
user.add('Joao')
puts '-----'
