require './lib/braille_writer'
require './lib/dictionary'

input_file = File.open(ARGV[0], "r")
output_file = File.new(ARGV[1], "w")
dictionary = Dictionary.new
braille_writer = BrailleWriter.new(input_file, output_file)
braille_writer.run
require 'pry'; binding.pry
var = 0





