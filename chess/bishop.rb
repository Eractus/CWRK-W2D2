require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    self.diagonal_dirs
  end

  def symbol
    " ♝ "
  end
end
