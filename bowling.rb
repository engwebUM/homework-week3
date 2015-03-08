class Bowling
    
    attr_accessor :rolls, :gameCompleted, :totalScore
    
    
    def initialize
        @rolls = []
        @totalScore = 0
        @gameCompleted = false
    end
    
    
    def roll(pins)
        if !gameCompleted
            if pins == 10
                @rolls.push(pins)
                @rolls.push(0)
                else
                @rolls.push(pins)
            end
        end
        
        
    end
    
    
    def score
        # return the current score
        i = 0
        while !gameCompleted do
            #spare
            if @rolls[i] + @rolls[i+1] == 10
                @totalScore += sparePoints i
                #strike
                elsif @rolls[i] == 10
                @totalScore += strikePoints i
                else
                @totalScore += @rolls[i] + @rolls[i + 1]
            end
            
            i += 2
            
            if @rolls[i] == 19
                @gameCompleted = true
            end
        end
        
        @totalScore
        end
        
        
        
        def sparePoints position
            spare = 10
            
            if @rolls[position + 1]
                spare + @rolls[position + 1]
                else
                spare
            end
        end
        
        
        
        def strikePoints position
            strike = 10
            
            if @rolls[position + 2]
                if @rolls[position + 2] == strike
                    if @rolls[position + 4]
                        strike * 2 + @rolls[position + 4]
                        else
                        strike * 2
                    end
                    else
                    if @rolls[position + 3]
                        strike + @rolls[position + 2] + @rolls[position + 3]
                        else
                        strike + @rolls[position + 2]
                    end
                end
                else
                strike
            end
        end
end
    
    bowling = Bowling.new()
    bowling.roll(10)
    bowling.roll(8)
    bowling.roll(1)
    bowling.roll(10)
    bowling.roll(10)
#    bowling.score
#    bowling.rolls.each do |x|
#    puts x
#end