require_relative "../Piece"
require_relative "../Stepable"

class Knight < Piece
  include Stepable
  def symbol
    return :N
  end
end