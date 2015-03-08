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
    res = 0
    count = 0
    frame = 0
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
            raise "ErroIncompletoStrike" #Jogadas incompletas do strike
          end
        else
          if(@rolls[count+1]!=nil)
            if(@rolls[count]+@rolls[count+1]==10) #spare
              if(@rolls[count+2]!=nil)
                res+=10+@rolls[count+2]
                count+=2
              else
                raise "ErroIncompletoSpare" #Jogadas incompletas do spare
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
            raise "ErroIncompleto" #Jogadas incompletas
          end
        end
      frame+=1
    end
    if(@rolls[count+1]!=nil)
      raise "ErroTerminado" #Jogado depois do jogo estar terminado
    end
    res
  end

  # Add code as needed
end
