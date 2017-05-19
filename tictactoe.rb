#TODO: add ai, sanitization
#probably give each player a score after each move
#score = number of available winning lines
#eg p1: move(4) => p1=1
#   p2: move(5) => p1=1, p2=3
#   p1: move(8) => p1=2, p2=2
#   p2: move(7) => p1=0, p2=2
#maybe score needs to be array of possible lines with 1 or 2 sigils already placed


require_relative 'board'

class Game
  @@games_played = 0

  def initialize(player1, player2)
    puts "Buckle up for some Tic Tac Toe carnage!"
    @board = Board.new
    @player = [player1, player2]
  end

  def start
    puts "game started"
    current_player_index = 1
    
    @board.display
    game_won = false
    winner = nil
    while !game_won && !@board.filled
      current_player_index += 1
      current_player_index = 0 if current_player_index == 2 
      move(@player[current_player_index])
      
      
      @board.display
      game_won = @board.win_status
      if game_won
        winner = @player[current_player_index]
      end
        
       
    end

    end_game(winner)
    
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


