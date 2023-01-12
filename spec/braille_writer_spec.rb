require './spec/spec_helper'
require './lib/braille_writer'

describe 'braillewriter' do
  before(:all) do

    input_file = '.message.txt'
    output_file = '.braille.txt'
    @braille_writer = BrailleWriter.new(input_file, output_file)
  end

  it "exists" do
    expect(@braille_writer).to be_an_instance_of(BrailleWriter)
  end




end