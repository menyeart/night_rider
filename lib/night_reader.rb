require './lib/english_writer'
require './lib/dictionary'

input_file = File.open(ARGV[0], "r")
output_file = File.new(ARGV[1], "w")
dictionary = Dictionary.new
english_writer = EnglishWriter.new(input_file, output_file)
english_writer.run
require 'pry'; binding.pry
var = 0
