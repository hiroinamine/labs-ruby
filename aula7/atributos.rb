# Atributos
class Dog
    def name
        @name
    end

    def name= name
        @name = name
    end
end

dog = Dog.new
dog.name = 'Marlon'
puts dog.name
puts '-----'

# forma mais simples, syntax sugar
class Dog
    attr_accessor :name, :age
end
dog = Dog.new
dog.name = 'Marlon'
dog.age = 2
puts dog.name, dog.age
