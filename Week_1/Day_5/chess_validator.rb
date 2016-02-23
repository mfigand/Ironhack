require 'pry'

class Board
  def read_Files
    simBoard = File.open("simple_board.txt", "r").readlines
    simMoves = File.open("simple_moves.txt", "r").readlines
    @sbArray = []
    @smArray = []
    simBoard.each do |i|
      @sbArray.push (i.split(" "))
    end
    simMoves.each do |i|
      @smArray.push (i.split(" "))
    end
  end
  def find_positions
    @stPosArray = []
    @finPosArray = []
    @smArray.each do |i|
      @stPosArray.push(i[0])
      @finPosArray.push(i[1])
    end
  end
  def start_position
    @con = {"a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8}
    @startArray = []
    @stPosArray.each do |i|
      @startArray << i.split(//)
    end
    @startArray.each do |i|
      i[0] = @con[i[0]]
      i[1] = i[1].to_i
    end
  end
  def final_position
    @finalArray = []
    @finPosArray.each do |i|
      @finalArray << i.split(//)
    end
    @finalArray.each do |i|
      i[0] = @con[i[0]]
      i[1] = i[1].to_i
    end
  end
  def find_piece_name
    @bNamePiece = []
    @wNamePiece = []
    @sbArray.each do |i|
      i.each do |j|
        if j[0] == "b"
          @bNamePiece << j
        elsif j[0] == "w"
          @wNamePiece << j
        end
      end
    end
  end
  def black_pieces
    @bNamePiece
  end
  def white_pieces
    @wNamePiece
  end
  # def board_Game
  #   boardGame = Array.new(8) { Array.new(8, "|_|") }
  #   binding.pry
  #   boardGame.each do |i|
  #     boardGame[i][i] = @sbArray[0..7]
  #   end
  #   boardGame
  # end
  def show_board
    read_Files
  end
end

class Validator
  def initialize (board)
    board.read_Files
    board.find_positions
    @startArray = board.start_position
    @finalArray = board.final_position
    board.find_piece_name
    @bpArray = board.black_pieces
    @wpArray = board.white_pieces
    #binding.pry
  end
  def validate_move
    s = 0
    @bpArray.each do |i|
      case i
        when "bR"
          Rook.new("Black Rook", @startArray[s], @finalArray[s]).move
          s += 1
        when "bN"
          Horse.new("Black Horse", @startArray[s], @finalArray[s]).move
          s += 1
        when "bB"
          Bishop.new("Black Bishop", @startArray[s], @finalArray[s]).move
          s += 1
        when "bQ"
          Queen.new("Black Queen", @startArray[s], @finalArray[s]).move
          s += 1
        when "bK"
          King.new("Black King", @startArray[s], @finalArray[s]).move
          s += 1
        when "bP"
          Pawn.new("Black Pawn", @startArray[s], @finalArray[s]).move
          s += 1
        when "--"
          puts "empty"
      end
    end   
  end
  
  # def find_final_positions
  #   start_position = []
  #   @smArray.each do |i|
  #     start_position.push ((i.split(" ").split(" "))
  #   end
  # end
end

class Piece
  def initialize (name, start_position, final_position)
    @name = name
    @startArray = start_position
    @finalArray = final_position
    #binding.pry
  end
end

module Movement
  def rook_move
      @startArray[0] == @finalArray[0] || @startArray[1] == @finalArray[1] ? "legal" : "ilegal"
    end
  def bishop_move
      if @startArray[0] == @finalArray[0] || @startArray[1] == @finalArray[1]
       "ilegal"
     elsif ((@finalArray[1]-@startArray[1])/(@finalArray[0]-@startArray[0])).abs == 1
       "legal" 
     else
       "ilegal"
     end
  end
  def queen_move
    rook_move == "legal" || bishop_move == "legal" ? "legal" : "ilegal"
  end
  def horse_move
    h = Math.hypot(@finalArray[1] - @startArray[1], @finalArray[0] - @startArray[0])
    h != Math.hypot(1,2) ? "ilegal" : "legal"
  end
  def king_move
    dist = @finalArray[0] - @startArray[0]
    queen_move == "legal" && dist <= 1 ? "legal" : "ilegal"
  end
  def pawn_firstMove
    dist = @finalArray[1] - @startArray[1]
    @startArray[0] == @finalArray[0] && @finalArray[1] > 2 && dist <= 2 ? rook_move : "ilegal"
  #binding.pry
  end
  def pawn_move
    dist = @finalArray[0] - @startArray[0]
    rook_move == "legal" && dist <= 1 ? "legal" : "ilegal"
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
    queen_move
  end
end

class Horse < Piece
  include Movement
  def move 
    horse_move
  end
end

class King < Piece
  include Movement
  def move
     king_move
  end
end

class Pawn < Piece
  include Movement
  def move
    @startArray[1] = 2 ? pawn_firstMove : pawn_move
    #binding.pry
  end
end

board1 = Board.new
val = Validator.new(board1)
val.validate_move


# rookB1 = Rook.new("Black Rook L","#{board1.movesArray[0]}","#{board1.movesArray[1]}")
# bishopW1 = Bishop.new("White Bishop R","d4", "b2")
# queenB = Queen.new("Black Queen","a2","c4")
# horseB = Horse.new("Black Horse", "b2", "c4")
# kingW = King.new("White King", "b2", "c3")
# pawnW = Pawn.new("White Pawn", "b2", "b4")

# puts rookB1.move
# puts bishopW1.move
# puts queenB.move
# puts horseB.move
# puts kingW.move
# puts pawnW.move



