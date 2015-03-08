class Bowling

  attr_reader :currentlyRollNumber, :rolls

  def initialize
    @rolls = Array.new(21, 0)
    @currentlyRollNumber = 0
    #@frameResult = Array.new(10)
  end

  def firstTry(pins)
    #Strike case
    if (pins == 10)
      @rolls[@currentlyRollNumber] = 10
      @rolls[@currentlyRollNumber+1] = "X"
      @currentlyRollNumber += 2
    else
      #normal case
      @rolls[@currentlyRollNumber] = pins
      @currentlyRollNumber += 1
    end
  end

  def secondTry(pins)
    #normal case
    #check if the number of pins of second roll try
    #didn't reached the limit (10 pins for each roll)
    if ((pins+@rolls[@currentlyRollNumber-1])<10)
      @rolls[@currentlyRollNumber] = pins
    else
      if ((pins+@rolls[@currentlyRollNumber-1]) == 10)
        #Spare case
        @rolls[@currentlyRollNumber-1] = 10
        @rolls[@currentlyRollNumber] = "/"
      else
        raise "Invalid number of pins"
      end
    end
    @currentlyRollNumber += 1
  end

  def roll(pins)
    #pins number must be between 0 and 10 for each roll
    if (pins >= 0 && pins <= 10)
      #roll number 19,20,21 are different than the others, has no bonus
      if (@currentlyRollNumber < 18)
        if (@currentlyRollNumber.odd?)
          #adding bonus if striked on last roll
          if(@rolls[@currentlyRollNumber-2] == "X")
            @rolls[@currentlyRollNumber-3] += pins
          end
          #second try of each roll
          secondTry(pins)
        else
          #adding bonus if striked or spared on last roll
          if(@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == "X")
            @rolls[@currentlyRollNumber-2] += pins
          end
          #first try of each roll
          firstTry(pins)
        end
      else
        #last frame
        if (@currentlyRollNumber == 18)
          #adding bonus if striked or spared on last roll
          if(@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == "X")
            @rolls[@currentlyRollNumber-2] += pins
          end
          @rolls[@currentlyRollNumber] = pins
          @currentlyRollNumber += 1
        elsif (@currentlyRollNumber == 19)
          #adding bonus if striked on last roll
          if(@rolls[@currentlyRollNumber-2] == "X")
            @rolls[@currentlyRollNumber-3] += pins
          end
          #if didnt spared/striked before
          @rolls[@currentlyRollNumber] = pins
          if (@rolls[18] == 10)
            #strike
            @rolls[@currentlyRollNumber] = pins
            #do a spare
          else
            if ((pins+@rolls[@currentlyRollNumber-1]) == 10)
              @rolls[@currentlyRollNumber-1] = 10
              @rolls[@currentlyRollNumber] = "/"
            end
          end
          @currentlyRollNumber += 1
        elsif (@currentlyRollNumber == 20)
          #In case we do a spare, or 2 strikes a row, or just playing the last ball
          if (@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == 10 || @rolls[@currentlyRollNumber-2] == 10)
            @rolls[@currentlyRollNumber] += pins
            @currentlyRollNumber += 1
            puts "dasdasdasd"
          else
            @currentlyRollNumber += 1
            puts "You didn't spared/striked before, you can't play the 3rd ball"
          end
        elsif (@currentlyRollNumber > 20)
          puts "No rolls left, game is over"
        end
      end
    else
      raise "Invalid number of pins"
    end
  end

  def score
    $i = 0
    $score = 0
    while $i<@currentlyRollNumber do
      $frame_score = @rolls[$i]
      if($frame_score == "X" || $frame_score == "/")
        $i+=1
      else
        $score += $frame_score
        $i+=1
      end
    end
    puts @rolls.join(' ')
    return $score
  end
end

bowling = Bowling.new()
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)
bowling.roll(10)



score = bowling.score
puts "Your final score is: #{score}!"
