class Calculator
 #attr_reader :first :second
 def initialize(first, second)
  @first = first.to_i
  @second = second.to_i
 end

  def write_result (last_result)
    file = File.open("last_result.txt", "w")
    file.puts(last_result)
    file.close
    last_result
  end

  # def read_result (last_result)
  #   file = File.open("last_result.txt", "r")
  #   file
  # end

 def add
  last_result = @first + @second
  write_result(last_result)
 end

 def substract
  last_result = @first - @second
  write_result(last_result)
 end

 def multiply
  last_result = @first * @second
  write_result(last_result)
 end

 def divide
  last_result = (@first / @second).to_f
  write_result(last_result)
 end


end