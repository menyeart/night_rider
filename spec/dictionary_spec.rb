require './spec/spec_helper'
require './lib/dictionary'

describe 'dictionary' do
  it "exists" do
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end



end