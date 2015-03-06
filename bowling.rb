class Bowling
  def initialize 
  	@score=Array.new(10) { Hash.new }
    @gamescore=Array.new
    @spare=0
  end


  def roll(pins)
    raise unless pins.is_a?(Numeric)
    if(pins>10 || pins <0)
      raise ArgumentError, 'Number pins incorrect'
    end

    for i in 0..@score.length-1
      if i<9
        if (@score[i][0] == nil)
          @score[i][0]=pins
          break
        elsif (@score[i][1] == nil && @score[i][0]!=10)
          if @score[i][0]+pins>10
            raise ArgumentError, 'Number pins too large'
          end
          @score[i][1]=pins
          break
        end
      elsif @score[i][0] == nil && i==9
          @score[9][0]=pins
      elsif @score[i][1] == nil && i==9
          @score[9][1]=pins
      elsif @score[i][2] == nil && i==9
          @score[9][2]=pins
      end
    end
  end


  def score
    @strike=0
    for i in 0..@score.length-1
      if (@score[i][0] != nil && @score[i][0]!=10)
        callSpare(i)
        @gamescore << @score[i][0]
      elsif @score[i][0]!=nil && @score[i][0]==10
        callSpare(i)
        @strike=1
        Strike(i)
      end
      if @strike==0
         if (@score[i][1] != nil && @score[i][1]+@score[i][0]==10)
           @spare=1
           @gamescore[positionElement]=@score[i][0]+@score[i][1]
         elsif (@score[i][1] != nil && @score[i][1]+@score[i][0]!=10)
           @gamescore[positionElement]=@gamescore[positionElement]+@score[i][1]
         end
      else
        @strike=0
      end
    end
    if (@score[9][2]!=nil) && @score[9][0]+@score[9][1]==10
      Spare(@score[9][2])
      @spare=0
    end
    return @gamescore.inject{|sum,x| sum + x }
  end

  private

  def callSpare(i)
     if(@spare==1)
      Spare(@score[i][0])
      @spare=0
    end
  end

  def positionElement
    @ind= @gamescore.length-1
    return @ind
  end

  def Spare(i)
    @gamescore[positionElement]=@gamescore[positionElement]+i
    @spare=0
  end

  def Strike(i)
    if i<8
      if @score[i+1][0]!=nil && @score[i+1][1]!=nil
        @gamescore<<@score[i+1][0]+@score[i+1][1]+10
      elsif @score[i+1][0]!=nil && @score[i+2][0]!=nil
          @gamescore<<@score[i+1][0]+@score[i+2][0]+10
      end
    elsif i==8 && @score[i+1][0]!=nil && @score[i+1][1]!=nil
      @gamescore<<@score[i+1][0]+@score[i+1][1]+10
        
      elsif @score[i][0]!=nil && @score[i][1]!=nil && @score[i][2]!=nil && i==9
        @gamescore<<@score[9][0]+@score[9][1]+@score[9][2]
    end
  end
end


