require_relative 'piece'
require_relative "null_piece"
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require 'byebug'

class Board
  attr_reader :board, :grid
  def initialize
    @grid = Array.new(8) { Array.new }
    self[[0, 0]] = Rook.new([0,0],:b, self)
    self[[0, 1]] = Knight.new([0,1],:b, self)
    self[[0, 2]] = Bishop.new([0,2],:b, self)
    self[[0, 3]] = Queen.new([0,3],:b, self)
    self[[0, 4]] = King.new([0,4],:b, self)
    self[[0, 5]] = Bishop.new([0,5],:b, self)
    self[[0, 6]] = Knight.new([0,6],:b, self)
    self[[0, 7]] = Rook.new([0,7],:b, self)
    8.times { |col| self[[1,col]] = Pawn.new([1, col], :b, self)}
    8.times { |col| self[[6,col]] = Pawn.new([6, col], :r, self)}
    self[[7, 0]] = Rook.new([7,0],:r, self)
    self[[7, 1]] = Knight.new([7,1],:r, self)
    self[[7, 2]] = Bishop.new([7,2],:r, self)
    self[[7, 3]] = Queen.new([7,3],:r, self)
    self[[7, 4]] = King.new([7,4],:r, self)
    self[[7, 5]] = Bishop.new([7,5],:r, self)
    self[[7, 6]] = Knight.new([7,6],:r, self)
    self[[7, 7]] = Rook.new([7,7],:r, self)
    [*2..5].each do |idx|
      8.times { self.grid[idx] << NullPiece.instance }
    end
  end

  def move_piece(start_pos, end_pos)
    # debugger
    raise "No piece at #{start_pos}" if self[start_pos] == NullPiece.instance
    raise "Cannot move to #{end_pos}" unless self[start_pos].moves.include?(end_pos)
    piece = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = piece
    piece.pos = end_pos
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    self.grid[row][col] = value
  end
end
