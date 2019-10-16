# Metodos - niveis de acessibilidade
# por default os metodos sao publicos

class Foo
    def call_protected
        self.lar
        # self.bar # gera excecao de acesso
    end

    def call_private
        bar
        # self.bar # gera excecao de acesso
    end

    protected

    def lar
        puts 'protected method'
    end

    private

    def bar
        puts 'private method'
    end

    def war
        puts 'another private method'
    end
end

foo = Foo.new
foo.call_private
foo.call_protected
