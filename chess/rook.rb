require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def move_dirs
    self.horizontal_dirs
  end

  def symbol
    " ♜ "
  end
end
