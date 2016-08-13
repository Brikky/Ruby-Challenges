class HumanPlayer
  attr_accessor :mark
  attr_reader :name

  def initialize(name="Bob")
    @name = name
  end

  def display(board)
    display_string = ""
    i=0
    while i < board.grid.length
      display_string << "#{board.grid[i]} \n"
      i+=1
    end
    puts display_string
  end

  def get_move
    puts "Where would you like to move?"
    move = gets.chomp.split(",").map(&:to_i)
  end


end
