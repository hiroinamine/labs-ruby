# Orientacao a Objetos
# Classe
class Computer
    def turn_on
        'turn on the computer'
    end

    def shutdown
        'shutdown the computer'
    end
end

computer = Computer.new
puts computer.turn_on
puts '-------'

# Heranca
class Animal
    def pular
        puts 'Toin! toim! boim! poim!'
    end

    def dormir
        puts 'Zzzzz!'
    end
end

class Cachorro < Animal
    def latir
        puts 'Au au'
    end
end

cachorro = Cachorro.new
cachorro.pular
cachorro.latir
puts '-------'

# Polimorfismo
class Instrumento
    def escrever
        puts 'Escrevendo'
    end
end

class Teclado < Instrumento
    def escrever
        puts 'teclado'
        super
    end
end

class Lapis < Instrumento
    def escrever
        puts 'Escrevendo a lapis'
    end
end

teclado = Teclado.new
lapis = Lapis.new
teclado.escrever
lapis.escrever