require "rspec"
require "pry"

class StringCalculator
  def add (string)
    sum = 0
    string.each do |i|#string.split(",")each do |i|
      sum += i.to_f
    end
    sum
  end
end

string = ["1","2","3"]
string1 = [""]
string2 = ["1.4","1"]
string3 = ["2.6\n1"]


RSpec.describe "String Calculator" do
  let(:calculator){StringCalculator.new}#Para cuando tiens una exepcion

  before :each do
    @calculator = StringCalculator.new
  end

  it "return the sum for elements in the string" do
    expect(calculator.add(string)).to eq(6)
  end

  
  it "return 0 for empty string" do
    expect(calculator.add(string1)).to eq(0)
  end

  it "return the sum for elements in the string" do
    expect(StringCalculator.new.add(string2)).to eq(2.4)
  end   
end

# if StringCalculator.new.add(string) == 6
#   puts "Work"
# else
#   puts "Don´t work"
# end

# if StringCalculator.new.add(string1) == 0
#   puts "Work"
# else
#   puts "Don´t work"
# end

# if StringCalculator.new.add(string2) == 2.4
#   puts "Work"
# else
#   puts "Don´t work"
# end