class Bowling
  attr_accessor :frames

  def initialize
    #@frames  = Array.new(10) { Frame.new }
    @frames    = Array.new(10) {Frame.new}
    #@frames[9] = Array.new     {LastFrames.new}
    @position  = 0
  end

  # Roll the desired number of pins
  def roll(pins)

    if (@position < 10)
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
    else
      puts "The game is allready over!"
    end
  end

  #Return the current score
  def score
    # totalScore = 0
    # frames.each do |frame|
    #   frame.rolls.each do |rollAux|
    #     # If the game isn't finished we don't sum nil values.
    #
    #     if !(rollAux.pins.nil?)
    #       totalScore += rollAux.pins
    #     end
    #   end
    # end
    totalScore = 0
    for i in 0 ... frames.size
      # Found Strike
      if (frames[i].rolls[0].pins == 10)
        # totalScore +=
        strike(i)
      else
        # Found Spare
        if (@frames[i].rolls[0].pins + @frames[i].rolls[1].pins == 10)
          # totalScore +=
          spare(i)
        else
          # Normal Score
          totalScore += @frames[i].rolls[0].pins + @frames[i].rolls[1].pins
        end
      end

    end
    puts "The final score for this game is: " + totalScore.to_s
  end

  # Return Spare value
  def spare(i)
    # Verify if is the last Frame
    if(i == 9)
      @frames[i].rolls[0].pins + @frames[i].rolls[1].pins + @frames[i].rolls[2].pins
    else
      @frames[i].rolls[0].pins + @frames[i].rolls[1].pins + @frames[i+1].rolls[0].pins
    end
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
    @roll.push(Array.new { Roll.new }) # add extra roll
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
# game.roll(10)
# game.roll(10)
# game.roll(10)
# game.roll(10)
# game.roll(10)
# game.roll(10)
# game.roll(10)

# game.score
