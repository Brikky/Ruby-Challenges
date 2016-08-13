class ComputerPlayer < HumanPlayer
  attr_accessor :mark
  attr_reader :name, :board


  def display(board)
    @board = board
  end

  def get_move
    # return winning move if there is one
    # check each subarray to see if any rows have 2 of computers symbol
    # transpose the array and check again
    # check the diagonals as special cases
    return winning_move if winning_move
  #else
    moved = false

    until moved
      position = [rand(3),rand(3)]
      moved = @board.place_mark(position,@mark)
    end
  end

  def winning_move
    grid = @board.grid
    i = 0
    diagonal_grid =[[grid[0][0], grid[1][1], grid[2][2]],
                   [grid[0][2], grid[1][1], grid[2][0]]]

    while i < grid.length
      test_grid = [grid, grid.transpose, diagonal_grid]

      if test_grid[0][i][0] == @mark && test_grid[0][i][1] == @mark
        return [i,2]
      elsif test_grid[1][i][0] == @mark && test_grid[1][i][1] == @mark
        return [2,i]
      elsif test_grid[2][i][0] == @mark && test_grid[2][i][1] == @mark
        if i == 0
          return [2,2]
        else
          return [2,0]
        end
      elsif test_grid[0][i][1] == @mark && test_grid[0][i][2] == @mark
        return [i,0]
      elsif test_grid[1][i][1] == @mark && test_grid[1][i][2] == @mark
        return [0,i]
      elsif test_grid[2][i][1] == @mark && test_grid[2][i][2] == @mark
        if i == 0
          return [0,0]
        else
          return [0,2]
        end
      elsif test_grid[0][i][0] == @mark && test_grid[0][i][2] == @mark
        return [i,1]
      elsif test_grid[1][i][0] == @mark && test_grid[1][i][2] == @mark
        return [1,i]
      elsif test_grid[2][i][0] == @mark && test_grid[2][i][2] == @mark
        return [1,1]
      end
      i+=1
    end
  end
end
