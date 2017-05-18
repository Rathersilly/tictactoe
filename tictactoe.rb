require_relative 'board'
#possible classes
#board
#player
#game
#
#
class Game
  @@games_played = 0

  def initialize(player1, player2)
    puts "Buckle up for some Tic Tac Toe carnage!"
    @board = Board.new
    @player = [player1, player2]
  end

  def start
    puts "game started"
    index = 1
    #while game not over
    @board.display
    game_won = false
    winner = nil
    while !game_won && !@board.filled# and board not filled
      index += 1
      index = 0 if index == 2 
      move(@player[index])
      
      
      @board.display
      game_won = @board.win_status
      if game_won
        winner = @player[index]
      end
        
       #find current player to move
    end

    end_game(winner)
    #get players move
    #update board
  end

  def move(player)
    puts "#{player.name}'s move?"
    move_square = gets.chomp
    @board.update(player, move_square)
  end

  def end_game(winner)
    puts "Game over!"
    if(winner)
      
      puts "#{winner.name} won!"
    else
      puts "It's a tie!"
    end
  end

end

class Player
  attr_accessor :name, :sigil

  @@player_number = 0

  def initialize(name)
    @name = name
    @@player_number += 1
   if @@player_number == 1
    @sigil = "X"
  else 
    @sigil = "O"
  end
    #if @@player_number > 2
      #dont allow creation
  end
end

player1 = Player.new("Mortimer")
player2 = Player.new("Horace")

game = Game.new(player1, player2)
game.start


