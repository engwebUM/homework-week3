class Bowling
  attr_accessor :frames, :totalScore

  def initialize
    #@frames  = Array.new(10) { Frame.new }
    @frames    = Array.new(10) {Frame.new}
    @frames[9] = LastFrame.new
    @position  = 0
    @totalScore = 0
  end

  # Roll the desired number of pins
  def roll(pins)
    # First Play in Last Frame
    if (@position == 9 && @frames[@position].rolls[0].pins.nil?)
      puts "entrou 1 fase: " + pins.to_s
      if (pins == 10)
        @frames[@position].addExtraRoll
      end
      @frames[@position].rolls[0].pins = pins
    else
      # Second Play in Last Frame
      if (@position == 9 && @frames[@position].rolls[1].pins.nil?)
        puts "entrou 2 fase: " + pins.to_s
        if (@frames[@position].rolls[0].pins + pins == 10)
          @frames[@position].addExtraRoll
        end
        @frames[@position].rolls[1].pins = pins
      else
        # Third Play in Last Frame
        if (@position == 9 && (@frames[@position].rolls[0].pins + @frames[@position].rolls[1].pins >= 10))
          puts "entrou 3 fase: " + pins.to_s
          @frames[@position].rolls[2].pins = pins
          @position = @position + 1
        else
          puts "Game is already Over"
        end
      end
    end

    # Game play from 0 to 8 Frame
    if (@position < 9)
      # First Roll play
      if (@frames[@position].rolls[0].pins.nil?)
        @frames[@position].rolls[0].pins = pins
        if (pins == 10)
          @frames[@position].rolls[1].pins = "0" # If strikes, the second roll is 0 because player wont play it!
          @position = @position + 1
        end
      else
          @frames[@position].rolls[1].pins = pins
          @position = @position + 1
      end
    end
  end

  #Return the current score
  def score
    @totalScore = 0
    for i in 0 ... @frames.size-1
      # Found Strike
      if (@frames[i].rolls[0].pins == 10)
        strike(i)
      else
        # Found Spare
        if (@frames[i].rolls[0].pins + @frames[i].rolls[1].pins == 10)
          spare(i)
        else
          @frames[i].rolls[0].pins + @frames[i].rolls[1].pins + @frames[i+1].rolls[0].pins
        end
      end
    end
    puts "\nFinal Score: " + @totalScore.to_s
  end

  # Return Strike value
  def strike(i)
    # Verify if is the last Frame
    if(i == 9)
      #for each da ultima posicao... Assure the 3 Consecutive Strikes..
      @frames[i].rolls.each do |rollAux|
        @totalScore += rollAux.pins
      end
    else
      # Search for the next 2 valid rolls
      if (@frames[i+1].rolls[0].pins == 10)
        # If the next frame exist Strike
        ## Verify if the next frame is the last frame (We can Have two consecutive Stikes or Pins down, in the same frame )
        if (i+1 == 9)
          @totalScore += @frames[i].rolls[0].pins + @frames[i+1].rolls[0].pins + @frames[i+1].rolls[1].pins
        else
        ## If not the last frame we can add the next 2 Rolls(ex: Strike+Strike or Strike+PinsDown) from the 2 next Frames
          @totalScore += @frames[i].rolls[0].pins + @frames[i+1].rolls[0].pins + @frames[i+2].rolls[0].pins
        end
      else
        # If the next frame doesn't exist Strike
        @totalScore += @frames[i].rolls[0].pins + @frames[i+1].rolls[0].pins + @frames[i+1].rolls[1].pins
      end
    end
  end

end

class Frame
   attr_accessor :score, :rolls
   def initialize
     @score
     @rolls = Array.new(2) { Roll.new }
   end
end

class LastFrame < Frame



  def addExtraRoll
    @rolls.push(Roll.new) # add extra roll
  end
end

class Roll
  attr_accessor :pins
  def initialize
    @pins
  end
end

game = Bowling.new

game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)

game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)

game.score
