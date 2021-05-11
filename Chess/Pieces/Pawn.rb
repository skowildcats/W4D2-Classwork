require_relative "../Piece"

class Pawn < Piece
  def symbol
    return :P
  end

  def moves
    possible_moves = []
    x = position[0]
    y = position[1]

    if at_start_row? && color == :White
      # possible_moves << [x+1, y] if board[x+1][y].is_a?(NullPiece) && ((0..7).include?(x+1) && (0..7).include?(y))
      possible_moves << [x+1, y] if board[x+1][y].is_a?(NullPiece) && ((0..7).include?(x+1) && (0..7).include?(y))
      possible_moves << [x+2, y] if board[x+2][y].is_a?(NullPiece) && ((0..7).include?(x+2) && (0..7).include?(y))
    elsif at_start_row? && color == :Black
      possible_moves << [x-1, y] if board[x-1][y].is_a?(NullPiece) && ((0..7).include?(x-1) && (0..7).include?(y))
      possible_moves << [x-2, y] if board[x-2][y].is_a?(NullPiece) && ((0..7).include?(x-2) && (0..7).include?(y))
    end

    if color == :White
      possible_moves << [x+1, y] if board[x+1][y].is_a?(NullPiece) && ((0..7).include?(x+1) && (0..7).include?(y))
      possible_moves << [x+1, y+1] if board[x+1][y+1].color == :Black && ((0..7).include?(x+1) && (0..7).include?(y+1))
      possible_moves << [x+1, y-1] if board[x+1][y-1].color == :Black && ((0..7).include?(x+1) && (0..7).include?(y-1))
    else
      possible_moves << [x-1, y] if board[x-1][y].is_a?(NullPiece) && ((0..7).include?(x-1) && (0..7).include?(y))
      possible_moves << [x-1, y+1] if board[x-1][y+1].color == :White && ((0..7).include?(x-1) && (0..7).include?(y+1))
      possible_moves << [x-1, y-1] if board[x-1][y-1].color == :White && ((0..7).include?(x-1) && (0..7).include?(y-1))
    end

    possible_moves.uniq

  end

  def at_start_row?
    if color == :White && position[0] == 1
      return true
    elsif color == :Black && position[0] == 6
      return true
    end
    false
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end
end