require "rspec"

class Game
  def check(number)
    result = ""
    if number % 3 == 0
      result += "fizz"
    end
    if number % 5 == 0
      result += "buzz"
    end
    result.empty? ? number : result
  end
end

RSpec.describe "fizzbuzz" do
   before :each do
     @game = Game.new
   end
   
  it "return the number you insert" do
    expect(@game.check(1)).to eq(1)
  end

  it "return 'fizz' for multiples of 3" do
    expect(@game.check(3)).to eq("fizz")
  end

  it "return 'fizz' for multiples of 5" do
    expect(Game.new.check(5)).to eq("buzz")
  end

  it "return 'fizzbuzz' for multiples of 3 and 5" do
    expect(Game.new.check(15)).to eq("fizzbuzz")
  end

end