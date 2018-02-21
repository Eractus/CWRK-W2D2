require 'singleton'
class NullPiece < Piece
  include Singleton
  def initialize
  end
  def color
    
  end

  def symbol
    " _ "
  end

  def display_symbol
    self.symbol
  end
end
