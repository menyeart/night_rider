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
    concat_full_message_top(string_array, @output_string)
    concat_full_message_mid(string_array, @output_string)
    concat_full_message_low(string_array, @output_string)
    split_line(@output_string)
    write_braille(@output_file, @output_string)
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

  def concat_full_message_top(message, output_string)
    message.each do |character|
      output_string.concat(convert_character_top(character)[0])
      output_string.concat convert_character_top(character)[1]
    end
    output_string
  end

  def concat_full_message_mid(message, output_string)
    message.each do |character|
      output_string.concat convert_character_mid(character)[0]
      output_string.concat convert_character_mid(character)[1]
    end
    output_string
  end

  def concat_full_message_low(message, output_string)
    message.each do |character|
      output_string.concat convert_character_low(character)[0]
      output_string.concat convert_character_low(character)[1]
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
end
