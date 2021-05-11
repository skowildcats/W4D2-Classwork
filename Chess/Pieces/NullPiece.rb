require_relative "../Piece"
require "Singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = nil
  end

  def symbol
    :_
  end
  
  def empty?
    return @symbol.nil?
  end

end