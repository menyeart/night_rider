require './lib/dictionary'

class BrailleWriter < Dictionary
  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def run
    @character_count = File.readlines(@input_file).join.length
    puts "Created 'braille.txt' containing #{@character_count} characters"
    convert_to_strings_array(@input_file)
  end

  def convert_character(character)
    self.english_to_braille[character]
  end

  def convert_to_strings_array(file)
   puts File.readlines(file)
  end










end