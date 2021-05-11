class Piece
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def inspect
    @color.inspect
  end

  def moves
  end

  def position=(value)
    @position = value
  end
  # protected
  attr_reader :color, :board, :position
end