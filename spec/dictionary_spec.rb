require './spec/spec_helper'
require './lib/dictionary'

describe 'dictionary' do
  it "exists" do
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end

  it "defines an alphabet of english to braille characters" do
    dictionary = Dictionary.new
    expect(dictionary.english_to_braille.keys.count).to eq(27)
    expect(dictionary.english_to_braille.values.count).to eq(27)
    expect(dictionary.english_to_braille["a"]).to eq({ top: ["0","."], mid: [".","."], low: [".","."] })
  end

  it "defines an alphabet of braille to english characters" do
    dictionary = Dictionary.new
    expect(dictionary.braille_to_english.keys.count).to eq(27)
    expect(dictionary.braille_to_english.values.count).to eq(27)
    expect(dictionary.braille_to_english["0....."]).to eq("a")
  end




end