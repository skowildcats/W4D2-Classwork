require_relative "./Pieces/NullPiece"
require_relative "./Pieces/Rook"
require_relative "./Pieces/King"
require_relative "./Pieces/Queen"
require_relative "./Pieces/Pawn"
require_relative "./Pieces/Knight"
require_relative "./Pieces/Bishop"
require 'byebug'

class Board

  def initialize()
    @board = Array.new(8) {Array.new(8)}
  end

  def populate
    (0..7).each do |i|
      (0..7).each do |j|
        #Rook
        @board[i][j] = Rook.new(:White, @board, [i, j]) if i == 0 && (j == 0 || j == 7)
        @board[i][j] = Rook.new(:Black, @board, [i, j]) if i == 7 && (j == 0 || j == 7)

        #Knight
        @board[i][j] = Knight.new(:White, @board, [i, j]) if i == 0 && (j == 1 || j == 6)
        @board[i][j] = Knight.new(:Black, @board, [i, j]) if i == 7 && (j == 1 || j == 6)

        #Bishop
        @board[i][j] = Bishop.new(:White, @board, [i, j]) if i == 0 && (j == 2 || j == 5)
        @board[i][j] = Bishop.new(:Black, @board, [i, j]) if i == 7 && (j == 2 || j == 5)

        #Queen
        @board[i][j] = Queen.new(:White, @board, [i, j]) if i == 0 && j == 3
        @board[i][j] = Queen.new(:Black, @board, [i, j]) if i == 7 && j == 3

        #King
        @board[i][j] = King.new(:White, @board, [i, j]) if i == 0 && j == 4
        @board[i][j] = King.new(:Black, @board, [i, j]) if i == 7 && j == 4

        #Pawn
        @board[i][j] = Pawn.new(:White, @board, [i, j]) if i == 1
        @board[i][j] = Pawn.new(:Black, @board, [i, j]) if i == 6

        @board[i][j] = NullPiece.instance if i > 1 && i < 6
      end
    end
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos[0], start_pos[1]
    x1, y1 = end_pos[0], end_pos[1]
    # debugger
    raise "No piece here" if @board[x][y].is_a?(NullPiece)

    if valid_pos?(start_pos) && valid_pos?(end_pos)
      if @board[x][y].color == @board[x1][y1].color 
        raise "Can't move here" 
      else
        
        @board[x1][y1] = @board[x][y]
        @board[x1][y1].position = end_pos
        @board[x][y] = NullPiece.instance
      end
    end    
  end

  def valid_pos?(pos)
    x, y = pos[0], pos[1]
    raise "Out of bounds" if !(0..7).include?(x) || !(0..7).include?(y)
    true
  end

  attr_reader :board
end

b = Board.new()
b.populate

# moves = 

p b.move_piece([1, 0], [5, 0])

b.board.each do |el|
  el.each do |piece|
    print "#{piece.symbol}  "
  end
  puts
end

p b.board[5][0].moves
p b.board[6][1].moves



# b.board.each do |el|
#   el.each do |piece|
#     print "#{piece.symbol}  "
#   end
#   puts
# end

# p b.board[5][3].move_diffs

# c = Board.new()
# c.populate
# (0..7).each do |i|
#   (0..7).each do |j|
#     if b.board[5][3].move_diffs.include?([i, j])
#       print "N"
#     else
#       print "_"
#     end
#   end
#   puts
# end

# b.board[1][1].board.each do |el|
#   el.each do |piece|
#     print "#{piece.symbol}  "
#   end
#   puts
# end
# b.board.each do |el|
#   el.each do |piece|
#     print "#{piece.symbol}  "
#   end
#   puts
# end