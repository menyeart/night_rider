require './lib/dictionary'

class EnglishWriter < Dictionary
  attr_reader :input_file, :output_file, :output_string

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @output_string = ""
    @character_count = File.readlines(@output_file).join.length
  end

  def run
    puts "Created original_message.txt containing #{@character_count} characters"
  end

  def create_line_array(file)
    File.readlines(file).map do |line| 
      line.delete("\n")
    end
  end

  def build_braille_character_string(line_array)
    braille_string = ''
    line_array.each do |line|
      braille_string.concat(line[0,2])
      line.slice(0,2)
    end
    braille_string
  end

  def convert_to_eng_char(string)
    self.braille_to_english[string]
  end



end
