class Bowling
  attr_reader :pins_standing, :playing_roll, :rolls

  def initialize
    @rolls = Array.new(21)
    @playing_roll = 0
    @pins_standing = 10
  end

  def roll(pins)
    raise "game over" if game_over?
    raise "impossible play" if pins < 0 || pins > pins_standing

    rolls[playing_roll] = pins
    if playing_roll < 18
      if playing_roll.even? && pins == 10
        rolls[playing_roll+1] = 0
        @playing_roll += 1
      else
        playing_roll.odd? ? @pins_standing = 10 : @pins_standing -= pins
      end
    else  # tenth frame
      rolls[20] = 0 if playing_roll > 18 && !(strike?(18) || spare?(18))
      pins == pins_standing ? @pins_standing = 10 : @pins_standing -= pins
    end
    @playing_roll += 1
  end

  def score
    points = 0
    roll_counter = 0
    for frame in 0..9
      if strike? (roll_counter)
        points += 10 + bonus_strike(roll_counter)
      elsif spare? (roll_counter)
        points += 10 + rolls[roll_counter+2].to_i
      else
        points += rolls[roll_counter].to_i + rolls[roll_counter+1].to_i
      end
      roll_counter += 2
    end
    points
  end

  def print_score
    puts "Score: " + score.to_s
    puts "Rolls: " + rolls.to_s
  end

  private

  def bonus_strike(roll_counter)
    if roll_counter < 18
      rolls[roll_counter+2].to_i +  if strike? (roll_counter+2)
                                      rolls[roll_counter+4].to_i
                                    else
                                      rolls[roll_counter+3].to_i
                                    end
    else  # tenth frame
      rolls[roll_counter+1].to_i + rolls[roll_counter+2].to_i
    end
  end

  def game_over?
    rolls.find_index(nil) == nil
  end

  def spare? (roll_counter)
    rolls[roll_counter].to_i + rolls[roll_counter+1].to_i == 10
  end

  def strike? (roll_counter)
    rolls[roll_counter].to_i == 10
  end
end
