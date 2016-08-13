require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @board = Board.new
  end

  def play_turn
    @current_player.display(@board)
    @board.place_mark(@current_player.get_move, @current_player.mark)
    switch_players!
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def play
    until @board.winner
      play_turn
      puts "Congratulations, #{@board.winner} won!" if @board.winner
      end
  end
end
