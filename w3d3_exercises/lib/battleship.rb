class BattleshipGame
  attr_reader :board, :player, :hit

  def initialize(player, board)
    @player = player
    @board = board
  end

  def attack(position)
    board[position] == :s ? @hit=true : @hit=false
    board[position] = :x
  end

  def count
    board.count
  end

  def game_over?
    !board.won?
  end

  def play_turn
    position = @player.get_play
    attack(position)
  end

end
