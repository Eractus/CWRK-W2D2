require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = Board.new
    @cursor = Cursor.new([0,0], board)
  end

  def render
    positions = []
    loop do
      system('clear')
      self.board.grid.each_with_index do |row, ridx|
        string = ""
        row.each_with_index do |piece, cidx|
          if self.cursor.cursor_pos == [ridx, cidx]
            string << piece.display_symbol.on_yellow
          else
            string << piece.display_symbol
          end
        end
        print string
        print "\n"
      end
      # begin
        input = self.cursor.get_input
        next if input.nil?
        positions << input.dup
        if positions.length == 2
          board.move_piece(positions.first, positions.last)
          positions = []
        end
      # rescue StandardError => e
      #   puts e.message
      #   positions = []
      #   retry
      # end
    end
  end
end

Display.new(Board.new).render
