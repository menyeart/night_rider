require './spec/spec_helper'
require './lib/braille_writer'
require './lib/dictionary'
require './lib/english_writer'

describe 'englishwriter' do
  before(:all) do

    @input_file = File.open('./braille_test.txt')
    @output_file = './original_message_test.txt'
    @english_writer = EnglishWriter.new(@input_file, @output_file)
    @dictionary = Dictionary.new
    @output_string = ""
  end

  it "exists" do
    expect(@english_writer).to be_an_instance_of(EnglishWriter)
  end

  it "read an input file and create an arraay containing the lines" do
    expect(@english_writer.create_line_array(@input_file)).to eq(["0.0.00", "..0...", "......"])
  end

  it "can extract the first braille character" do
    string_array = ["0.0.00", "..0...", "......"]
    expect(@english_writer.build_braille_character_string(string_array)).to eq("0.....")
  end

  it "can convert a braille character string to its english character equivalent" do
    braille_char_string = "0....."
    expect(@english_writer.convert_to_eng_char(braille_char_string)).to eq("a")
  end

  it "can add a converted character to the output string" do
    char = 'a'
    @english_writer.add_to_output(char)
    expect(@output_string).to eq("a") 
  end

end

