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
    @frame=1
    @score=0
  end


  def roll(pins)
    # roll the desired number of pins
    @rolls[i]=pins
    @i=i+1
end

  def score
    # return the current score
    #i é indice que rolls que indica o numero a que o lançamento se refere,
    # se o lançamento é o primeiro de uma frame e e um strike vamos considerar que passa na mesma um lançamento apesar de este ser inexistente
    @i=0
    @score=0
    @frame=1
    while @frame<10
      puts "Frame: "
      puts @frame

      if @rolls[@i]==10 #strike
     #   puts "Strike"
        if @rolls[@i+2]==10
          @score+=10+@rolls[@i+2]+@rolls[@i+4]
        else
          @score+=10+@rolls[@i+2]+@rolls[@i+3]
        end

        else if @rolls[@i]+@rolls[@i+1]==10 #spare
        @score+=10+@rolls[@i+2]
        else
          @score+=@rolls[@i]+@rolls[@i+1]
        end
      end
      @i+=2
      @frame+=1
      print "Score: "
      print @score
    end

    #Last frame score
    puts "Frame: "
    puts @frame
    if  @frame=10
      if @rolls[@i]==10 #strike
        @score+=10+@rolls[@i+1]+@rolls[@i+2]
      else if @rolls[@i]+@rolls[@i+1]==10 #spare
             @score+=10+@rolls[@i+2]
           else
             @score+=@rolls[@i]+@rolls[@i+1]
             end
      end
    end

    @score
    print "Score: "
    print @score
  end

  # Add code as needed
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
