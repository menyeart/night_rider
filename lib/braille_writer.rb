require './lib/dictionary'

class BrailleWriter < Dictionary
  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def run
    @character_count = File.readlines(@input_file).join.length
    string_array = convert_to_strings_array(@input_file)
    require 'pry'; binding.pry
    convert_full_message(string_array)
    puts "Created 'braille.txt' containing #{@character_count} characters"
  end

  def convert_character_top(character)
    self.english_to_braille[character][:top]
  end

  def convert_character_mid(character)
    self.english_to_braille[character][:mid]
  end

  def convert_character_low(character)
    self.english_to_braille[character][:low]
  end

  def convert_to_strings_array(file)
    File.readlines(file).to_s.gsub(/[^0-9a-z ]/i, '').split("").join.split("")
  end

  def convert_full_message(message)
    message.each do |character|
      puts convert_character_top(character)
      putsconvert_character_top(character)
      puts convert_character_top(character)
    end
  end










end