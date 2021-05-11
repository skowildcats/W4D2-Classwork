require_relative "../Piece"
require_relative '../Stepable'

class King < Piece
  include Stepable
  
  def symbol
    :K
  end
end