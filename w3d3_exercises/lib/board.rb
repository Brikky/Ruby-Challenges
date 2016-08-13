class Board
attr_reader :grid, :ships


  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    @ships = 0
    Array.new(10) {Array.new(10)}
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, mark)
    row, col = position
    @grid[row][col] = mark
  end

  def empty?(position = nil)
    if position
    self[position].nil?
    else
      count == 0
    end
  end

  def count
    @grid.flatten.select { |pos| pos == :s }.length
  end

  def full?
    !@grid.flatten.any?(&:nil?)
  end

  def place_random_ship
    raise "full" if full?
    #else
    placed = false
    until placed
      position = [rand(@grid.length), rand(@grid.length)]
      if empty?(position)
        self[position] = :s
        placed = true
      end
    end
  end

  def won?
    !self.grid.flatten.any?{|position| position == :s }
  end

end
