require 'rspec'
require './lexiconomicron.rb'

RSpec.describe 'Lexiconomicron' do
  before :each do
    @lexi = Lexiconomicron.new
  end


  it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end

  it "Flip the order of the words in a array, cut off the t´s and display the first and last element of the array" do
    expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
  end

  it "it takes the ones which size is three characters of less in the same order" do
    expect(@lexi.eat_t(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
  end

end

