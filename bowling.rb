class Bowling

	



  def initialize
    @frames=Array.new(21,0)
    @actual_frame=1
    @actual_roll=1
    @actual_pos=0
  end

  def showFrames
    frame_counter=1
    while frame_counter<=@actual_frame do
      position=(frame_counter*2)-2
      p @frames[position]
      p @frames[position+1]
      frame_counter+=1

    end
  end



  def roll(pins)
    # roll the desired number of pins
    #pins must be between 0 and 10
    if pins<0 or pins>10 then
    	puts "Invalid number of pins"
    else
      if @actual_roll==1 and pins==10
        #strike
        @frames[@actual_pos]=pins
        @frames[@actual_pos+1]='X'
        @actual_pos+=2
        @actual_frame+=1
      elsif @actual_roll==2 and @frames[@actual_pos-1]+pins==10
        #spare
        @frames[@actual_pos]='/'
        @actual_pos+=1
        @actual_frame+=1
        @actual_roll=1
      elsif @actual_roll==2 and @frames[@actual_pos-1]+pins!=10 
        @frames[@actual_pos]=pins
        @actual_pos+=1
        @actual_frame+=1
        @actual_roll=1
      else
        @frames[@actual_pos]=pins
        @actual_pos+=1
        @actual_roll=2
      end
    end
  end


  def score
    score=0
    frame_counter=1
    while frame_counter<=@actual_frame and frame_counter<=10 do
      score+=framePoints(frame_counter)
      frame_counter+=1
    end
      return score
    end


  def spare?(first_n_frame)
    pos=(first_n_frame*2)-2
  	if (@frames[pos+1])=='/' then
  		return true
  	else
  		return false
  	end
  end

  def strike?(first_n_frame)
    pos=(first_n_frame*2)-2
  	if @frames[pos+1]=='X' then
  		return true
  	else 
  		return false
  	end
  end


  def framePoints(frame)
    score=0
    position=(frame*2)-2
    if spare?(frame)
      score=10+@frames[position+2]
    elsif strike?(frame)
      if strike?(frame+1)
        score=20+@frames[position+4]
      elsif spare?(frame+1)
        score=20
      else
        score=10+@frames[position+2]+@frames[position+3]
      end
    else
      score=@frames[position]+@frames[position+1]
    end
    puts score
    return score
  end
        

end


b=Bowling.new

=begin
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
=end

#puts b.frames[0]
#puts b.frames[1]
#puts b.frames[2]


puts b.score
