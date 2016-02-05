require "pry"

# class Board
#   def show_board
#     board = Array.new(8) { Array.new(8, "|_|") }

#     board.each do |row|
#       print row
#       puts ""
#     end
#   end
# end

# class Validator
#   @positionfile = "#{@position}positionfile.log"
# end

class Piece
  def initialize (name, start_position, final_position)
    @name = name
    con = {"a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8}
    @startArray = start_position.split(//)
    @finalArray = final_position.split(//)
    @startArray[0] = con[@startArray[0]]
    @startArray[1] = @startArray[1].to_i
    @finalArray[0] = con[@finalArray[0]]
    @finalArray[1] = @finalArray[1].to_i
    # binding.pry
  end
end

module Movement
  def rook_move
    @startArray[0] === @finalArray[0] || @startArray[1] === @finalArray[1] ? "legal" : "ilegal"
  end
  def bishop_move
    m = (@finalArray[1]-@startArray[1])/(@finalArray[0]-@startArray[0])
    m.abs == 1 ? "legal" : "ilegal"
  end
end

class Rook < Piece
  include Movement
  def move
    rook_move
  end
end

class Bishop < Piece
  include Movement
  def move
    bishop_move
  end
end

class Queen < Piece
  include Movement
  def move
    rook_move == "legal" || bishop_move == "legal" ? "legal" : "ilegal"
  end
end

class Horse < Piece
  def move 
    h = Math.hypot(@finalArray[1] - @startArray[1], @finalArray[0] - @startArray[0])
    h != Math.hypot(1,2) ? "ilegal" : "legal"
  end
end

# class King < Piece
#   include Movement
#   def move
#     rook_move == "legal" || bishop_move == "legal" ? "legal" : "ilegal"
#   end
# end


# rookB1 = Rook.new("Black Rook L","b1","b3")
# bishopW1 = Bishop.new("White Bishop R","d4", "b2")
# queenB = Queen.new("Black Queen","a2","b4")
# horseB = Horse.new("Black Horse", "b2", "c4")

# kingW = King.new("White King", "b2", "c4")

# puts rookB1.move
# puts bishopW1.move
# puts queenB.move
# puts horseB.move
# puts kingW.move



