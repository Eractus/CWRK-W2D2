HORIZONTAL_DIRS = [
  [0, 1],
  [0, -1],
  [1, 0],
  [-1, 0]
]

DIAGONAL_DIRS = [
  [-1, -1],
  [-1, 1],
  [1, -1],
  [1, 1]
]


module SlidingPiece
  def horizontal_dirs
    HORIZONTAL_DIRS.select do |dir|
      new_pos = self.pos.dup
      new_pos[0] += dir[0]
      new_pos[1] += dir[1]
      return false unless (0..7).cover?(new_pos[0]) && (0..7).cover?(new_pos[1])
      true
    end
  end

  def diagonal_dirs
    DIAGONAL_DIRS.select do |dir|
      new_pos = self.pos.dup
      new_pos[0] += dir[0]
      new_pos[1] += dir[1]
      return false unless (0..7).cover?(new_pos[0]) && (0..7).cover?(new_pos[1])
      true
    end
  end

  def moves
    total_moves = []
    self.move_dirs.each do |move|
      total_moves += self.grow_unblocked_moves_in_dir(move[0], move[1])
    end
    total_moves
  end

  def move_dirs
    self.horizontal_dirs + self.diagonal_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves = []
    initial = self.pos.dup
    loop do
      next_pos = initial
      next_pos[0] += dx
      next_pos[1] += dy
      break unless (0..7).cover?(new_pos[0]) && (0..7).cover?(new_pos[1])
      break if self.board[next_pos].color == self.color
      moves << next_pos
      break if self.board[next_pos].color != self.color &&
        self.board[next_pos].is_a?(NullPiece) == false
      initial = next_pos
    end
    moves
  end
end



# position >> build an array of positions (moves arr) >> make a new pos one more space in that direction
# if its on the board and a piece of same color, dont add it to the moves arr and break loop
# if its on the board and an opponent color, add it to the moves arr and break loop
# if its an empty space, add it to the moves arr, keep going
# if its off the board, break the loop (dont add)
#
#
#
#
#   grow => [[1,2],[3,4]]
#
#   total_moves = [[[1,2],[3,4]][[1,2],[3,4]][[1,2],[3,4]]]
