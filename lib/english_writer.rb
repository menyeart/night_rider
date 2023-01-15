require './lib/dictionary'

class EnglishWriter< Dictionary
  attr_reader :input_file, :output_file, :output_string

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @output_string = ""
    @character_count = File.readlines(@input_file).join.length
  end

