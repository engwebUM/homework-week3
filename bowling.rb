class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    # roll the desired number of pins
    if(pins>=0 && pins <=10)
      @rolls << pins
    else
      raise "ErroPins"
    end
  end

  def score
    # return the current score
    res = count = frame = 0
    resarr = []
    err = false
    while (frame < 10 && @rolls[count]!=nil)
        if(@rolls[count] == 10) #strike
          if(@rolls[count+1]!=nil && @rolls[count+2]!=nil)
            res+=10+@rolls[count+1]+@rolls[count+2]
            if(frame==9)
              count+=2
            else
              count+=1
            end
          else
            err = true
          end
        else
          if(@rolls[count+1]!=nil)
            if(@rolls[count]+@rolls[count+1]==10) #spare
              if(@rolls[count+2]!=nil)
                res+=10+@rolls[count+2]
                count+=2
              else
                err = true
              end
            elsif(@rolls[count]+@rolls[count+1]>10) #erro > 10
              raise "ErroScore"
            else
              res+=@rolls[count]+@rolls[count+1]
              if(frame==9)
                count+=1
              else
                count+=2
              end
            end
          else
            err = true
          end
        end
      frame+=1
    end
    if(@rolls[count+1]!=nil && frame == 10 && err==false)
      raise "ErroTerminado" #Jogado depois do jogo estar terminado
    end
    res
  end

  # Add code as needed
end
