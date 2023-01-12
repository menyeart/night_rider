require './lib/braille_writer'

input_file = File.open(ARGV[0], "r")
output_file = File.new(ARGV[1], "w")
braille_writer = BrailleWriter.new(input_file, output_file)
braille_writer.run
require 'pry'; binding.pry





