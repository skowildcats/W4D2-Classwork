module Stepable

  KING_SET = [[1, 1], [1, -1], [-1, 1], [-1, -1], [0, 1], [1, 0], [-1, 0], [0, -1]]
  KNIGHT_SET = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
  def moves

  end

  def move_diffs
    
    possible_moves = []
    if symbol == :K
      KING_SET.each do |ele|
        check_x = position[0] + ele[0]
        check_y = position[1] + ele[1]

        check = board[check_x][check_y]
        if check.is_a?(NullPiece)
          possible_moves << [check_x, check_y]
        elsif check.color != @color
          possible_moves << [check_x, check_y]
        end
      end
    elsif symbol == :N
      KNIGHT_SET.each do |ele|
        check_x = position[0] + ele[0]
        check_y = position[1] + ele[1]

        check = board[check_x][check_y]
        if check.is_a?(NullPiece)
          possible_moves << [check_x, check_y]
        elsif check.color != @color
          possible_moves << [check_x, check_y]
        end
      end
    end
    possible_moves
  end
end