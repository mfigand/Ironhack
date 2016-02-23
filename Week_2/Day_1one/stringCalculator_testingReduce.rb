class StringCalculator
  def sum (stringNumbers)
    numbers = stringNumbers.split(",")
    numbers.reduce(0) do |memo, num|
      memo = num.to_i
    end
  end
end

string = ["1","2","3"]
string1 = [""]
string2 = ["1.4","1"]
string3 = ["2.6\n1"]

RSpec.describe "String Calculator" do
  it "return the sum for elements in the string" do
    expect(StringCalculator.new.add(string)).to eq(6)
  end
end

RSpec.describe "String Calculator" do
  it "return 0 for empty string" do
    expect(StringCalculator.new.add(string1)).to eq(0)
  end
end

RSpec.describe "String Calculator" do
  it "return the sum for elements in the string" do
    expect(StringCalculator.new.add(string2)).to eq(2.4)
  end
end