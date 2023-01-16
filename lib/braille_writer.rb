require './lib/dictionary'

class BrailleWriter < Dictionary
  attr_reader :input_file, :output_file, :output_string

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @output_string = ""
    @character_count = File.readlines(@input_file).join.length
  end

  def run
    string_array = convert_to_strings_array(@input_file)
    concat_full_message(:top, string_array, @output_string)
    concat_full_message(:mid, string_array, @output_string)
    concat_full_message(:low, string_array, @output_string)
    split_line(@output_string)
    write_braille(@output_file, @output_string)
    puts return_char_count(@character_count)
  end

  def convert_character(position,character)
    self.english_to_braille[character][position]
  end

  def convert_to_strings_array(file)
    File.readlines(file).to_s.gsub(/[^0-9a-z ]/i, '').split("").join.split("")
  end

  def concat_full_message(position, message, output_string)
    message.each do |character|
      output_string.concat(convert_character(position, character)[0])
      output_string.concat(convert_character(position, character)[1])
    end
    output_string
  end

  def split_line(string)
      position_1 = string.length / 3
      position_2 =  (string.length - position_1) + 1
      string.insert(position_1, "\n")
      string.insert(position_2, "\n")
  end

  def write_braille(file, output_string)
    file = File.open(file, "w")
    file.write(output_string)
    file.close
  end

  def return_char_count(chars)
    "Created 'braille.txt' containing #{chars} characters"
  end
end
