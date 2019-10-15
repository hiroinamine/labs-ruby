# Construtor
class Person
    def initialize(name, age)
        @name = name
        @age = age
    end

    def check
        puts "instancia inicializada com valoes: #{@name} - #{@age}"
    end
end

person = Person.new('joao', 10)
person.check