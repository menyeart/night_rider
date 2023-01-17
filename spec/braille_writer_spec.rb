require './spec/spec_helper'
require './lib/braille_writer'
require './lib/dictionary'

describe 'braillewriter' do
  before(:all) do

    @input_file = File.open('./message_test.txt')
    @output_file = './braille_test.txt'
    @braille_writer = BrailleWriter.new(@input_file, @output_file)
    @dictionary = Dictionary.new
    @output_array = []

  end

  it "exists" do
    expect(@braille_writer).to be_an_instance_of(BrailleWriter)
  end

  it "can convert a single character to it's dictionary class equivalent of the part" do
    expect(@braille_writer.convert_character(:top, 'a')).to eq(["0","."])
    expect(@braille_writer.convert_character(:mid, 'a')).to eq([".", "."])
    expect(@braille_writer.convert_character(:low, 'a')).to eq([".", "."])
  end

  it "can convert an input file into an array of character arrays" do
    expect(@braille_writer.convert_to_arrays_array(@input_file)).to eq([["a", "b", "c"]])
  end

  it "can concatenate every set of a message's converted two braille characters into a string" do
    message = ["a","b","c"]
    @output_string = ''
    expect(@braille_writer.concat_full_message(:top, message, @output_array)).to eq(["0.0.00"])
  end

  it "can write the contents of the output string to a specific file" do
    string = "abc"
    @braille_writer.write_braille(@output_file, string)
    expect(File.readlines(@output_file)[0]).to eq("abc")
  end

  it "can return a string with the original english message character count interpolated" do
    chars = 5
    expect(@braille_writer.return_char_count(chars)).to eq("Created 'braille.txt' containing #{chars} characters")
  end

  it "can read a string from a file, create an output file, convert the string to braille and output it to the output file" do
    @braille_writer.run
    expect(File.read(@output_file)).to eq("0.0.00\n..0...\n......")
  end
end