# Require
# require './animal.rb' # procura com base no local onde está sendo executado o ruby
# por tras o ruby junta todos em um arquivo só de forma sequencial
require_relative 'animal'
require_relative 'cachorro'

animal = Animal.new
animal.pular

cachorro = Cachorro.new
cachorro.latir
puts '-----'