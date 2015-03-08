class Bowling

  def initialize
    @frames    = Array.new(9) {Frame.new}
    @frames.push(LastFrame.new)
    @position   = 0
    @totalScore = 0
  end

  # Roll the desired number of pins
  def roll(pins)
    # First Play in Last Frame
    if (@position == 9 && @frames[@position].rolls[0].pins.nil?)
      @frames[@position].rolls[0].pins = pins
      if (pins == 10)
        @frames[@position].addExtraRoll
      end
      # Second Play in Last Frame
    elsif (@position == 9 && @frames[@position].rolls[1].pins.nil?)
        @frames[@position].rolls[1].pins = pins
        if (@frames[@position].rolls[0].pins + pins == 10 && (@frames[@position].rolls[0].pins != 10))
          @frames[@position].addExtraRoll
        else
          if (@frames[@position].rolls[0].pins + pins < 10 )
            @position = @position + 1
          end
        end
      else
        # Third Play in Last Frame
        if (@position == 9 && (@frames[9].rolls[0].pins + @frames[9].rolls[1].pins >= 10))
          @frames[@position].rolls[2].pins = pins
          @position = @position + 1
        end
    end

    # Game play for the firs 9 Frames
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
    for i in 0 ... @frames.size
      # Found Strike
      if (@frames[i].rolls[0].pins == 10)
        strike(i)
      else
        # Found Spare
        if (@frames[i].rolls[0].pins + @frames[i].rolls[1].pins == 10)
          spare(i)
        else
          # Normal Pontuation
            @totalScore += @frames[i].rolls[0].pins + @frames[i].rolls[1].pins
        end
      end
    end
    puts "\nFinal Score: " + @totalScore.to_s
  end

  # Return Strike value
  def strike(i)
    # Verify if is the last Frame
    if(i == 9)
      # For each in last position: Assure the 3 Consecutive Strikes or less...
      @frames[i].rolls.each do |rollAux|
        if !(rollAux.pins.nil?)
          @totalScore += rollAux.pins
        end
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

  # Return Spare value
  def spare(i)
    # Verify if is the last Frame
    if(i == 9)
      @frames[i].rolls.each do |rollAux|
        if !(rollAux.pins.nil?)
          @totalScore += rollAux.pins
        end
      end
    else
      @totalScore = @frames[i].rolls[0].pins + @frames[i].rolls[1].pins + @frames[i+1].rolls[0].pins
    end
  end

  #Print the Frames Scores
  def printFrames
    @frames.each do |frame|
      print "|"
      frame.rolls.each do |rollAux|
        print " " + rollAux.pins.to_s + " "
      end
    end
    puts "|\n"
  end
end

class Frame
   attr_accessor :score, :rolls
   def initialize
     @rolls = Array.new(2) { Roll.new }
   end
end

class LastFrame < Frame
  def addExtraRoll
    @rolls.push(Roll.new) # Add extra roll
  end
end

class Roll
  attr_accessor :pins
  def initialize
    @pins
  end
end

game = Bowling.new

game.roll(5)
game.roll(5)

game.roll(10)
game.roll(10)

game.roll(10)
game.roll(10)

game.roll(10)
game.roll(10)

game.roll(5)
game.roll(1)

game.roll(5)
game.roll(2)

game.roll(5)
game.roll(5)
game.roll(10)


game.roll(10)

game.score
game.printFrames
