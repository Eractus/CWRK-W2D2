class Piece
  attr_reader :color, :symbol, :board
  attr_accessor :pos

  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def symbol
    " ♟ "
  end

  def display_symbol
    self.color == :b ? self.symbol.blue : self.symbol.red
  end
end
