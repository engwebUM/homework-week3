class Bowling
  attr_accessor :frames

  def initialize
    #@frames  = Array.new(10) { Frame.new }
    @frames  = Array.new(10) { Frame.new }
    @position = 0
  end

  # Roll the desired number of pins
  def roll(pins)

    if (@frames[@position].rolls[0].pins.nil?)
      @frames[@position].rolls[0].pins = pins
    else
      @frames[@position].rolls[1].pins = pins
      @position = @position + 1
    end
    #@frames.push(Frame.new) # Add frame at the end of array
  end

  #Return the current score
  def score
    totalScore = 0
    frames.each do |frame|
      frame.rolls.each do |rollAux|
          totalScore += rollAux.pins
      end
    end
    puts totalScore
  end

end

class Frame
   attr_accessor :score, :rolls
   def initialize
     @score
     @rolls = Array.new(2) { Roll.new }
   end
end

class LastFrame < Frame
  def initialize
    @roll.push(Array.new { Roll.new }) # adicionar o roll extra
  end
end

class Roll
  attr_accessor :pins
  def initialize
    @pins
  end
end

game = Bowling.new
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)

game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
game.roll(10)
# game.roll(10)
# game.roll(10)
game.score
