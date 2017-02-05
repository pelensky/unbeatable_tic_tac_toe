# Controls the flow of the game

class Game

  attr_reader :player1, :player2, :board, :current_player, :winner

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @winner = false
  end

  def new_game(player)
    player == @player1.marker ? @current_player = @player1 : @current_player = @player2
  end

  def play(space)
    change_turns if @board.take_turn(space, @current_player.marker) != "Illegal move"
  end

  def show_board
    @board.show_board
  end

  def game_over?
    @board.game_over?
  end

  def game_tied?
    @board.tied?
  end

  def update_game_status
    @winner = "X" if @board.game_won?("X")
    @winner = "O" if @board.game_won?("O")

  end

  def change_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  private

  def set_winner
    @winner = @board.winner
  end

end
