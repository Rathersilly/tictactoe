
class Board
  def initialize
    # @game_array = [["1|2|3"],
    #                ["-----"],
    #                [" | | "],
    #                ["-----"],
    #                [" | | "]]
    @filled_squares = 0
    @move_array = Array.new(2)
    @game_array = Array.new(3){Array.new(3)}
    square = 1
    row = ""
    5.times do |i|
      row = ""
      if i.even?
        
        3.times do |j|
          row += square.to_s
          square += 1
          row += "|" if j < 2   
        end
        
      else
        row = "-----"
      end
      @move_array[i] = row
      
      3.times do |i|
        3.times do |j|
          @game_array[i][j] = " "
        end
      end
    end

  end

  def update(player, move)
    move = move.to_i
    row  = (move-1)/3
    col = (move%3) - 1
    col = 2 if col == -1
   

    
    @game_array[row][col] = player.sigil
    @filled_squares += 1
  end

  def win_status
    #check horizontal
    #use regex
    pattern = /(\w)\1\1/
    
    diag1 = ""
    diag2 = ""
    3.times do |i|
      test_string = @game_array[i].join
      
      return true if pattern.match?(test_string)
      
      test_string = ""
      
      3.times do |j|
        # 00 11 22    02 11 20
        # i = j       i + j = 2
        test_string += @game_array[j][i]
        
        diag1 += @game_array[i][j] if i == j
        diag2 += @game_array[i][j] if i + j == 2
     
      end
      # puts "diag1: #{diag1}"
      # puts "diag2: #{diag2}"
      if pattern.match?(test_string) || pattern.match?(diag1) || pattern.match?(diag2)
       return true         
      end       
       
    end

    return false
  end

  def filled
    if @filled_squares  >= 9
      return true
    else
      return false
    end
  end

  



  def display
    #puts @game_array
    #puts @move_array
    3.times do |i|
      3.times do |j|
         print @game_array[i][j]
         print "|" if j < 2
      
      end
      print "\n"
      puts "-----" if i < 2
    end

  end

end