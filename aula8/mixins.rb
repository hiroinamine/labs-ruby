# Module - Mixins
module ImpressaoDecorada
    def imprimir text
        decoracao = '#' * 25
        puts decoracao
        puts text
        puts decoracao
    end
end

# mixins de modulo atraves do include
module Pernas
    include ImpressaoDecorada

    def chute
        imprimir 'CHUTE'
    end
end

module Bracos
    include ImpressaoDecorada

    def jab
        imprimir 'JAB'
    end

    def gancho
        imprimir 'GANCHO'
    end
end

class  LutadorX
    include Pernas
    include Bracos
end

class LutadorY
    include Pernas
end

lutador1 = LutadorX.new
lutador1.jab
lutador1.chute
lutador2 = LutadorY.new
lutador2.chute
