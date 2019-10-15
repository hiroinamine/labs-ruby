# GEMS - pacote com funcionalidade especifica, semelhante biblioteca
# gem install os ou utilizar o bundler para instalar as dependencias
require 'os'

def my_os
    if OS.windows?
        "Windows"
    elsif OS.linux?
        "Linux"
    elsif OS.mac?
        "Mac"
    else
        "Nao consegui identificar"
    end
end

puts "Meu PC possui #{OS.cpu_count} cores, é #{OS.bits} bits e o sitema operaciona é #{my_os}"