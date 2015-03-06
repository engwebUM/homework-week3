class Bowling

	attr_accessor :player
	attr_accessor :frames

	def initialize(player_name)
		@player=player_name
		@frames=Array.new
	end



  def roll(pins)
    # roll the desired number of pins
    #pins must be between 0 and 10
    if pins<0 or pins>10 then
    	puts "Invalid number of pins"
    else
    	frames << pins
    end
  end

  def score
    actual_frame=1
    actual_pos=0
    score=0
    while actual_frame<=10 do 
      if spare?(actual_pos)
        puts "spare----\n"
        puts "Position:" 
        puts actual_frame
        

        score+=sparePoints(actual_pos)
        actual_pos+=2
        actual_frame+=1


      elsif strike?(actual_pos)
        puts "strike----\n"
        puts "Position:" 
        puts actual_frame

        score+=strikePoints(actual_pos)
        actual_pos+=1
        actual_frame+=1

      else
        puts "normal frame----\n"
        puts "Position:" 
        puts actual_frame
        

        score+=framePoints(actual_pos)
        actual_pos+=2
        actual_frame+=1

        
      end
      #print for debug
      puts score
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

