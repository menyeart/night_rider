require './spec/spec_helper'
require './lib/braille_writer'
require './lib/dictionary'

describe 'braillewriter' do
  before(:all) do

    @input_file = File.open('./message_test.txt')
    @output_file = '.braille.txt'
    @braille_writer = BrailleWriter.new(@input_file, @output_file)
    @dictionary = Dictionary.new
    @output_string = ''

  end

  it "exists" do
    expect(@braille_writer).to be_an_instance_of(BrailleWriter)
  end

  it "can convert a single character to it's dictionary class equivalent of the top part" do
    expect(@braille_writer.convert_character_top('a')).to eq(["0","."])
  end

  it "can convert a single character to it's dictionary class equivalent of the middle part" do
    expect(@braille_writer.convert_character_mid('a')).to eq([".", "."])
  end

  it "can convert a single character to it's dictionary class equivalent of the low part" do
    expect(@braille_writer.convert_character_low('a')).to eq([".","."])
  end

  it "can convert an input file into a array of single character strings" do
    expect(@braille_writer.convert_to_strings_array(@input_file)).to eq(["s","t","r","i","n","g"])
  end

  it "can concatenate every set of a message's converted top two braille characters into a string" do
    message = ["a","b","c"]
    output_string = ''
    expect(@braille_writer.concat_full_message_top(message, output_string)).to eq("0.0.00")
  end

  it "can concatenate every set of a message's converted middle two braille characters into a string" do
    message = ["a","b","c"]
    output_string = ''
    expect(@braille_writer.concat_full_message_mid(message, output_string)).to eq("..0...")
  end

  it "can concatenate every set of a message's converted low two braille characters into a string" do
    message = ["a","b","c"]
    output_string = ''
    expect(@braille_writer.concat_full_message_low(message, output_string)).to eq("......")
  end

  it "can insert newlines in the output string between the low, mid and top parts" do
    string = "abc"
    expect(@braille_writer.split_line(string)).to eq("a\nb\nc")
  end






end