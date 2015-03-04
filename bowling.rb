class Bowling
  def initialize 
  	@score=Array.new
  	@game=Array.new(3)
    @strike=Array.new() 
  	@value=0
  	@numberRoll=1
  	@auxStrike=0
    @countStrike=0
    @numberRound=0
    @numberRoundTot=0
    @ifcondition=true
    @aaa=0
    @valueposition9=0
  end
  def roll(pins)
    # roll the desired number of pins
 @numberRoundTot= @numberRoundTot+1

 if (@countStrike==11)

@aaa=1
  if @valueposition9==0
    
  
    @score[8]=@score[8]+@score[9]+pins

    
  end
  calculeStrike(pins ,pins)

 
end

 if (@countStrike==12)


  @score[9]=@score[9]+pins
@aaa=1
 
end

if @countStrike==9 && pins==10

  @valueposition9=1
end


    if ((@numberRoll==1  && ifcondition) && @aaa==0 )
      
 
    	@game[0]=pins
    	
    	if @value==10
    		@ind= positionElement
    	
    		@score[@ind]= @score[@ind]+ pins
    		@value=0
    	end
		@numberRoll=2

    if (@auxStrike=1 && @countStrike>1 && @countStrike<11)
      calculeStrike(10,pins)
      @auxStrike=0
 
    end


      
    
        if(pins==10)
           @numberRound=@numberRound+1
           if @countStrike>11
            numberRoll=2
            @game[0]=0
             else
               @numberRoll=1
           end
       
          if(@numberRound<11)
          @score<< 10
        
        
        

            
        end
        if (@countStrike!=11)
          @ind= positionElement
          @strike<<@ind
          @auxStrike=1
          @countStrike=@countStrike+1
        end
        end
		

    	return @score
    elsif (@numberRoll==2 )
    	@game[1]=pins
    	if (@game[0]+@game[1]==10 )
    		@value=10
         @numberRoundTot= @numberRoundTot+1
    	end

    if @auxStrike==1
      calculeStrike(@game[0],@game[1])
      @auxStrike=0
    end

      insertArray
    	@numberRoll=1

    	return @score
	
    end


  end

  def ifcondition
    @rtn=false
   
   if (@numberRound<13 && @numberRoundTot<21)
    @rtn=true
  
   end

   return @rtn
  end

  def calculeStrike(res1,res2)
      @score[@strike[0]]=@score[@strike[0]]+res1+res2
      @strike.shift

  end

  def positionElement
  	@ind= @score.length-1
  	return @ind
  end

  def insertArray
  	@score << (@game[0]+@game[1])
  end

  def score
    # return the current score

   
    puts "#{@score.inject{|sum,x| sum + x }}"
     puts "#{@score}"
  end


  # Add code as needed
end

bl=Bowling.new
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)
bl.roll(10)

bl.roll(1)
bl.roll(1)


bl.score