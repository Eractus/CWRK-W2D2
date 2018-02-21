class Pawn < Piece
  attr_reader :start_row
  def initialize(pos, color, board)
    super(pos, color, board)
    @start_row = self.pos[0]
  end

  def at_start_row?
    self.pos[0] == self.start_row
  end

  def forward_dir
    self.start_row == 1 ? 1 : -1
  end

  def moves
    move_diffs = [
      [self.forward_dir*2, 0],
      [self.forward_dir, 0],
      [self.forward_dir, 1],
      [self.forward_dir, -1]
    ]
    poss = move_diffs.map do |move|
      new_move = self.pos.dup
      new_move[0] += move[0]
      new_move[1] += move[1]
      new_move
    end
    poss.select! { |move| (0..7).cover?(move[0]) && (0..7).cover?(move[1]) }
    actual = []
    actual << poss[0] if at_start_row? && self.board[poss[0]].is_a?(NullPiece)
    actual << poss[1] if poss[1] && self.board[poss[1]].is_a?(NullPiece)
    actual << poss[2] if poss[2] && self.board[poss[2]].color != self.color && self.board[poss[0]].is_a?(NullPiece) == false
    actual << poss[3] if poss[3] && self.board[poss[3]].color != self.color && self.board[poss[0]].is_a?(NullPiece) == false
    print actual
    sleep (3)
    actual
  end
end
