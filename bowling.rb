class Bowling

  def initialize
    @frames = Array.new(9) {Frame.new}
    @frames.push(LastFrame.new)
    @position = 0
  end

  # Roll the desired number of pins
  def roll(pins)
    # Verify invalid numbers
    if (pins < 0 || pins > 10)
      return "Invalid Values" # Used for RSpec tests
    else
      # Choose the game behavior.
      case @position
      when 0..8
        # Verify is exceeds the Maximum pins per Frame
        if (sumAllRollsInFrame(@position) + pins > 10 )
         return "Exceeds the maximum pins available for this frame" # Used for RSpec tests
       else
        framePlay(pins)
        end
      when 9
        # Verify is exceeds the Maximum pins in the Last Frame
        if (@frames[9].rolls.length == 2 && (@frames[9].rolls[0] != 10))
          if (sumAllRollsInFrame(@position) + pins > 10)
           return "Exceeds the maximum pins available in the Last frame" # Used for RSpec tests
         end
       end
       lastFramePlay(pins)
     else
        return "Game is already over" # Used for RSpec tests
      end
    end
  end

  # Game play for the first 9 Frames
  def framePlay(pins)
      # First Roll play
      if (@frames[@position].rolls[0].pins.nil?)
        @frames[@position].rolls[0].pins = pins
        if (pins == 10)
          # If Strikes, the second roll is 0 because player wont play it!
          @frames[@position].rolls[1].pins = "0"
          @position = @position + 1
        end
      else
        # Second Roll play
        @frames[@position].rolls[1].pins = pins
        @position = @position + 1
      end
  end

  # Game play for last Frame
  def lastFramePlay(pins)
    # First Roll Play in Last Frame
    if (@frames[@position].rolls[0].pins.nil?)
      @frames[@position].rolls[0].pins = pins
      if (pins == 10)
        # Add one Roll to the last frame(Cause: Strike)
        @frames[@position].addExtraRoll
      end
      # Second Roll Play in Last Frame
    elsif (@frames[@position].rolls[1].pins.nil?)
        @frames[@position].rolls[1].pins = pins
        if (@frames[@position].rolls[0].pins + pins == 10 && (@frames[@position].rolls[0].pins != 10))
          # Add one Roll to the last frame(Cause: Spare)
          @frames[@position].addExtraRoll
        else
          if (@frames[@position].rolls[0].pins + pins < 10 )
            @position = @position + 1
          end
        end
        # Third Roll Play in Last Frame (Only when exists)
      else
        if ((@frames[9].rolls[0].pins + @frames[9].rolls[1].pins >= 10))
          @frames[@position].rolls[2].pins = pins
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
        @totalScore += strike(i)
      else
        # Found Spare
        if (sumAllRollsInFrame(i) == 10)
          @totalScore += spare(i)
        else
          # Normal Pontuation
          @totalScore += sumAllRollsInFrame(i)
        end
      end
    end
    puts "\nFinal Score: " + @totalScore.to_s
    return @totalScore
  end

  # Return Strike value
  def strike(i)
    if(i == 9)
      return (sumAllRollsInFrame(i))
    else
      # Search for the next 2 valid rolls
      if (@frames[i+1].rolls[0].pins == 10)
        # If the next frame exist Strike
        ## Verify if the next frame is the last frame (We can Have two consecutive Stikes or Pins down, in the same frame )
        if (i+1 == 9)
         return (@frames[i].rolls[0].pins + @frames[i+1].rolls[0].pins + @frames[i+1].rolls[1].pins)
        else
        ## If not the last frame we can add the next 2 Rolls(ex: Strike+Strike or Strike+PinsDown) from the 2 next Frames
          return (@frames[i].rolls[0].pins + @frames[i+1].rolls[0].pins + @frames[i+2].rolls[0].pins)
        end
      else
        # If the next frame doesn't exist Strike
        return (@frames[i].rolls[0].pins + @frames[i+1].rolls[0].pins + @frames[i+1].rolls[1].pins)
      end
    end
  end

  # Return Spare value
  def spare(i)
    if(i == 9)
      return (sumAllRollsInFrame(i))
    else
      return (@frames[i].rolls[0].pins + @frames[i].rolls[1].pins + @frames[i+1].rolls[0].pins)
    end
  end

  # Sum all the rolls in the last frame
  def sumAllRollsInFrame(i)
    sumAux = 0
    @frames[i].rolls.each do |rollAux|
      if !(rollAux.pins.nil?)
        sumAux += rollAux.pins
      end
    end
    return (sumAux)
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
    @rolls.push(Roll.new) # Add extra roll when needed
  end
end

class Roll
  attr_accessor :pins
  def initialize
    @pins
  end
end

# game = Bowling.new
# 20.times {game.roll(6)} # Bad Example to test.
# game.score
# game.printFrames
#
# game = Bowling.new
# 22.times {game.roll(5)}
# game.score
# game.printFrames
#
# game = Bowling.new
# 12.times {game.roll(10)}
# game.score
# game.printFrames
