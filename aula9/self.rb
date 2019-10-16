# Self
class Foo
    attr_accessor :color
    def bar
        puts self
    end

    def pen_color
        puts "The color is #{self.color}"
    end

    def self.blah # Metodos de classe = estatico
        puts 'blah!'
    end
end

puts Foo.blah
foo = Foo.new
puts foo
foo.bar
foo.color = 'blue'
foo.pen_color