module SteppingPiece
  def moves
    total_moves = []
    self.move_diffs.each do |move|
      new_pos = self.pos.dup
      new_pos[0] += move[0]
      new_pos[1] += move[1]
      next unless (0..7).cover?(new_pos[0]) && (0..7).cover?(new_pos[1])
      total_moves << new_pos unless self.board[new_pos].color == self.color
    end
    total_moves
  end

  def move_diffs
  end
end
