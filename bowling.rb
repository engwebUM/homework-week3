class Bowling

  def initialize
    @frames  = Array.new() #array to save objects of Frame Class
    @isSpare = 0
    @isStrike  = 0
  end

  def roll(pins)
    # roll the desired number of pins
    frame = current_frame
    frame.roll(pins)
    verifications(pins, frame)
  end

  def current_frame
    if (@frames.empty? || @frames.last.verifyIsEnd==true) # "frames.empty?" return true if the content of array frames is empty
      @frames << Frame.new  # add new Frame to the array frames
    end
    return @frames.last  #return the last frame, it's necessary to work always whith last positions
  end

  def previous_frame(position)
        return @frames[position] 
  end

  def verifications (pins, frame)
    
    if (@isStrike==1 && frame.verifyIsEnd==true) # if have a Strike and the current frame is in the end (2nd frame roll or strike in 1st frame roll) 
     previous_frame(-2).bonus = frame.score # -2 is the next to last element in the array frames, the bonus of the priveous frame is a current frame score  
     @isStrike = 0 #reset STRIKE
    end

    if (pins == 10) # verify if a downed pins number is a STRIKE
      @isStrike = 1 # value 1 -> have STRIKE
    end
    
    if (@isSpare == 1) #verify if have a SPARE          
      previous_frame(-2).bonus = pins # # -2 is the next to last element in the array frames, add pins number to the bonus in the previous_frame
      @isSpare = 0 # reset isSpare
    end
    
    if (frame.score == 10) #verify if have a SPARE
      @isSpare = 1  # value 1 -> have SPARE
    end
  end

  def score
    # return the current score
    current_score = 0
    @frames.each do |frame| 
      current_score = current_score + frame.score # Into each frame, in the frames array, make a items sum and add for the current total score
    end
    return current_score
  end
end



class Frame

  attr_accessor :bonus

  def initialize
    @firstRoll = 0
    @secondRoll = 0
    @bonus = 0
    @counterRoll = 0  
  end

  def roll(pins)
    if (@counterRoll == 0)
      @firstRoll = pins
    else (@counterRoll == 1)
      @secondRoll  = pins
    end
    @counterRoll = @counterRoll + 1
  end

  def verifyIsEnd
    if (@counterRoll >= 2 || @firstRoll == 10) # if is a 2nd roll of the frame or Strike in the first Roll of the frame, the frame is completed
      return true
    else return false
    end
  end

  def score 
    return @firstRoll + @secondRoll + @bonus #count a frame score
  end 
end


