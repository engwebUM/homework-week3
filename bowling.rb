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
    score=0
    while actual_frame<=10 do 
      if spare?(actual_frame)
        score+=sparePoints(actual_frame)
        actual_frame++
      elsif strike?(actual_frame)
        score+=strikePoints(actual_frame)
        actual_frame++
      else
        score+=pins_in_frame(actual_frame)

          
          

      end

      
    end
  end


  def spare?(first_n_frame)
  	if (@frames[first_n_frame-1]+@frames[first_n_frame])==10 then
  		return true
  	else
  		return false
  	end
  end

  def strike?(first_n_frame)
  	if @frames[first_n_frame-1]==10 then
  		return true
  	else 
  		return false
  	end
  end

  def framePoints(first_n_frame)
    score=0
    score+=@frames[first_n_frame-1]+@frames[first_n_frame]
    return score
  end

  def sparePoints(first_n_frame)
    points=0
    points+=10+@frames[first_n_frame+2]
    return points
  end

  def strikePoints(first_n_frame)
    points=0
    points+=10+@frames[first_n_frame+2]@frames[first_n_frame+3]
    return points
  end

end


b=Bowling.new("fred")

b.roll(10)
b.roll(10)
b.roll(5)
b.roll(4)
b.roll(6)
b.roll(4)
#test
puts b.strike?(1)
#yes
puts b.strike?(2)
#yes
puts b.spare?(2)
#no
puts b.spare?(3)
#no
puts b.spare?(4)
#yes
puts b.spare?(5)
#yes