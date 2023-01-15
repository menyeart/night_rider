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

end

