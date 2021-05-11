module Slideable

  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []

  # def horizontal_dirs
  #   x, y = self.position[0], self.position[1]
  #   horizontal_arr = self.board[x]
  #   vertical_arr = self.board.transpose[y]
  #   return horizontal_arr, vertical_arr
  # end

  def diagonal_dirs
    move_set = []
    move_set += grow_unblocked_moves_in_dir(1, -1)
    move_set += grow_unblocked_moves_in_dir(1, 1)
    move_set += grow_unblocked_moves_in_dir(-1, -1)
    move_set += grow_unblocked_moves_in_dir(-1, 1)
  end

  def moves
  end


  # private
  def horizontal_dirs
    move_set = []
    move_set += grow_unblocked_moves_in_dir(1, 0)
    move_set += grow_unblocked_moves_in_dir(-1, 0)
    move_set += grow_unblocked_moves_in_dir(0, 1)
    move_set += grow_unblocked_moves_in_dir(0, -1)
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    check_x = position[0] + dx
    check_y = position[1] + dy
    possible_moves = []

    while (0..7).include?(check_x) && (0..7).include?(check_y)
      check = board[check_x][check_y]
      if check.is_a?(NullPiece)
        possible_moves << [check_x, check_y]
        check_x += dx
        check_y += dy
      elsif check.color == @color
        break
      else
        possible_moves << [check_x, check_y]
        break
      end
    end

    possible_moves
  end
end