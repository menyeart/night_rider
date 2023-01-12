class BrailleWriter
  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def run
    @character_count = File.readlines(@input_file).join.length
    puts "Created 'braille.txt' containing #{@character_count} characters"
  end






end