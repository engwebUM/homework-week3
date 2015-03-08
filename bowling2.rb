class Bowling

	attr_accessor :player
	attr_accessor :frames
  @actual_frame=0
  @actual_roll=0

	def initialize(player_name)
		@player=player_name
		@frames=Array.new(11,0){Array.new(2,0)}
	end



  def roll(pins)
    # roll the desired number of pins
    #pins must be between 0 and 10
    if pins<0 or pins>10 then
    	puts "Invalid number of pins"
    else 
      @frames[@actual_frame][@actual_roll]=pins
      if @actual_roll==0 and pins==10
        @actual_frame+=1
      end
      if @actual_roll==1
        @actual_frame+=1
        @actual_roll=0
      end
    end
  end

  def score
    score=0
    frame_counter=0
    while frame_counter<@actual_frame
      if spare?(frame_counter)

      elsif strike?(frame_counter)


      else

      end

    end
  end 


  def spare?(first_n_frame)
    if (@frames[first_n_frame][0]+@frames[first_n_frame][1])==10 then
      return true
    else
      return false
    end
  end

  def strike?(first_n_frame)
    if @frames[first_n_frame][0]==10 then
      return true
    else 
      return false
    end
  end

  def framePoints(first_n_frame)
    score=0
    score+=@frames[first_n_frame][0]+@frames[first_n_frame+1][1]
    return score
  end

  def sparePoints(first_n_frame)
    points=0
    points+=10+@frames[first_n_frame+1][0]
    return points
  end

  def strikePoints(first_n_frame)
    points=0
    points+=10+@frames[first_n_frame+1][0]+@frames[first_n_frame+1][1]
    return points
  end

  













  def score2
    score=0
    while @actual_frame<10 do 
      if spare?(@actual_pos)
        score+=sparePoints(@actual_pos)
        @actual_pos+=2
        @actual_frame+=1
      elsif strike?(@actual_pos)
        score+=strikePoints(@actual_pos)
        @actual_pos+=1
        @actual_frame+=1
      else
        score+=framePoints(@actual_pos)
        @actual_pos+=2
        @actual_frame+=1
      end
    end
    return score
  end


  def spare?(first_n_frame)
  	if (@frames[first_n_frame]+@frames[first_n_frame+1])==10 then
  		return true
  	else
  		return false
  	end
  end

  def strike?(first_n_frame)
  	if @frames[first_n_frame]==10 then
  		return true
  	else 
  		return false
  	end
  end

  def framePoints(first_n_frame)
    score=0
    score+=@frames[first_n_frame]+@frames[first_n_frame+1]
    return score
  end

  def sparePoints(first_n_frame)
    points=0
    points+=10+@frames[first_n_frame+2]
    return points
  end

  def strikePoints(first_n_frame)
    points=0
    points+=10+@frames[first_n_frame+1]+@frames[first_n_frame+2]
    return points
  end

end


b=Bowling.new("fred")

b.roll(10)
b.roll(7)
b.roll(3)
b.roll(7)
b.roll(2)
b.roll(9)
b.roll(1)
b.roll(10)
b.roll(10)
b.roll(10)
b.roll(2)
b.roll(3)
b.roll(6)
b.roll(4)
b.roll(7)
b.roll(3)
b.roll(3)
#b.roll(0)



#puts b.frames[0]
#puts b.frames[1]
#puts b.frames[2]



puts b.score()

