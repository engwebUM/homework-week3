class Bowling

  def initialize
    @frames = Array.new(9) {Frame.new}
    @frames.push(LastFrame.new)
    @position = 0
  end

  # Roll the desired number of pins
  def roll(pins)
    case @position
    when 0..8
      framePlay(pins)
    when 9
      lastFramePlay(pins)
    else
      puts "Game is already over"
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
        @frames[@position].addExtraRoll
      end
      # Second Roll Play in Last Frame
    elsif (@frames[@position].rolls[1].pins.nil?)
        @frames[@position].rolls[1].pins = pins
        if (@frames[@position].rolls[0].pins + pins == 10 && (@frames[@position].rolls[0].pins != 10))
          @frames[@position].addExtraRoll
        else
          if (@frames[@position].rolls[0].pins + pins < 10 )
            @position = @position + 1
          end
        end
      else
        # Third Roll Play in Last Frame
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
    return @totalScore
  end

  # Return Strike value
  def strike(i)
    if(i == 9)
      sumLastFrame(i)
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
    if(i == 9)
      sumLastFrame(i)
    else
      @totalScore += @frames[i].rolls[0].pins + @frames[i].rolls[1].pins + @frames[i+1].rolls[0].pins
    end
  end

  # Sum all the rolls in the last frame
  def sumLastFrame(i)
    @frames[i].rolls.each do |rollAux|
      if !(rollAux.pins.nil?)
        @totalScore += rollAux.pins
      end
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
20.times {game.roll(1)}
game.printFrames
game.score


game = Bowling.new
21.times {game.roll(5)}
game.printFrames
game.score

game = Bowling.new
12.times {game.roll(10)}
game.printFrames
game.score
