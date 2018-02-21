require_relative 'stepping_piece'
class King < Piece
  include SteppingPiece

  def move_diffs
    [
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1],
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
  end

  def symbol
    " ♚ "
  end
end
