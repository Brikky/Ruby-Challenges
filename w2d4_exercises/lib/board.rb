
# I think it makes little sense for each of the player objects to possess a board,
# rather than one board to possess multiple player objects.

class Board
  attr_reader :grid

  def initialize(grid = nil)
    @grid = grid ||= Array.new(3) { Array.new(3) }
  end

  # interpret board[1,2] as board[1][2]
  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end

  def place_mark(position, mark)
    self[*position] = mark
    true 
  end

  def empty?(position)
    self[*position].nil?
  end

  def winner
    # test edge cases (Diagonals) first
    test_diagonals || test_row_and_col
  end

  def test_diagonals
    diagonal1 = [self[0, 0], self[1, 1], self[2, 2]]
    diagonal2 = [self[0, 2], self[1, 1], self[2, 0]]

    if diagonal1 == [:X, :X, :X] || diagonal1 == [:Y, :Y, :Y]
      return self[0, 0]
    elsif diagonal2 == [:X, :X, :X] || diagonal2 == [:Y, :Y, :Y]
      return self[0, 2]
    end
    nil
  end

  def test_row_and_col
    i = 0
    while i < @grid.length
      row = [self[i, 0], self[i, 1], self[i, 2]]
      column = [self[0, i], self[1, i], self[2, i]]

      if row == [:X, :X, :X] || row == [:O, :O, :O]
        return self[i, 0]

      elsif column == [:X, :X, :X] || column == [:O, :O, :O]
        return self[0, i]
      end
      i += 1

    end
    nil
  end

  def over?
    winner || @grid.all? { |arr| arr.all? { |e| !e.nil? } }
  end
end
