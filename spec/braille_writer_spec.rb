require './spec/spec_helper'
require './lib/braille_writer'
require './lib/dictionary'

describe 'braillewriter' do
  before(:all) do

   @input_file = File.open('./message.txt')
    @output_file = '.braille.txt'
    @braille_writer = BrailleWriter.new(@input_file, @output_file)
    @dictionary = Dictionary.new
  end

  it "exists" do
    expect(@braille_writer).to be_an_instance_of(BrailleWriter)
  end

  it "can convert a single character to it's dictionary class equivalent" do
    expect(@braille_writer.convert_character('a')).to eq({ top: ["0","."], mid: ["0","0"], low: ["0","0"] })
  end

  it "can convert an input file into a array of single character strings" do
    expect(@braille_writer.convert_to_strings_array(@input_file)).to eq(["s","t","r","i","n","g"])
  end



end