require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece

  def symbol
    " ♛ "
  end
end
