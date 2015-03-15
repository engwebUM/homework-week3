class Bowling
  attr_reader :rolls
  attr_reader :frame
  attr_reader :i
  attr_reader :score

  attr_writer :rolls
  attr_writer :frame
  attr_writer :i
  attr_writer :score

  def initialize
    @rolls=[]
    @i=0
    @frame=0
    @score=0
    @scoreframe=[]
  end


  def roll(pins)
    if i%2==0
      puts "-----------------------------------------"
      puts "Frame: "
      puts @frame
    end
    if not(pins<0 or pins>10)
      puts "Roll "
      puts pins
      @rolls[@i]=pins
      score
      puts "Score: "
      puts @score
    else
      puts "Number of pins invalid, it should be between 1 and 10. "
      puts "Invalid frame! "
      puts "Roll again"
      if i%2==1
        @i=@i-1

      end
    end
  end

  def score
    if @rolls[@i-2]==10
      if @rolls[@i-4]==10
        @scoreframe[@frame-2]+=@rolls[@i]
      end
      @scoreframe[@frame-1]+=@rolls[@i]
      @score=@scoreframe[@frame-1]
    end
    if @frame>0 and @i>2 and (@rolls[@i-2])+(@rolls[@i-1])==10
      @scoreframe[@frame-1]=@scoreframe[@frame-1]+@rolls[@i]
      @score=@scoreframe[@frame-1]
    end
    @score+=@rolls[@i]
    @i+=1
    if @i%2==0
      if @frame>=1
        @scoreframe[@frame-1]=@score
      end

      @frame=@frame+1


    end
  end

end

print "Tudo 0's"
bowling=Bowling.new
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
bowling.roll(0)
print bowling.score

print "Tudo 10's"
bowling2=Bowling.new
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(0)
bowling2.roll(10)
bowling2.roll(10)
bowling2.roll(10)
print bowling2.score
