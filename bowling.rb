class Bowling
  attr_reader :playing_roll, :rolls

  def initialize
    @rolls = Array.new(21, 0)
    @playing_roll = 0
  end

  def roll(pins)
    raise "jogada impossivel" if pins < 0 || pins > 10

    rolls[playing_roll] = pins
    @playing_roll += 1
  end

  def score
    points = 0
    roll_counter = 0
    for frame in 0..9
      if strike? (roll_counter)
        points += 10 + rolls[roll_counter+1] + rolls[roll_counter+2]
        roll_counter += 1
      elsif spare? (roll_counter)
        points += 10 + rolls[roll_counter+2]
        roll_counter += 2
      else
        points += rolls[roll_counter] + rolls[roll_counter+1]
        roll_counter += 2
      end
    end
    points
  end

  def print_score
    puts "Score: " + score.to_s
    puts "Rolls: " + rolls.to_s
  end

  private

  def spare? (index)
    rolls[index] + rolls[index+1] == 10
  end

  def strike? (index)
    rolls[index] == 10
  end
end
