class Bowling
  attr_reader :pins_standing, :rolls

  def initialize
    @rolls = Array.new(21)
    @pins_standing = 10
  end

  def roll(pins)
    raise "game over" if game_over?
    raise "impossible play" if pins < 0 || pins > pins_standing

    rolls[playing_roll] = pins
    if playing_roll < 18
      if playing_roll.odd? && pins == 10
        rolls[playing_roll] = 0
      else
        playing_roll.even? ? @pins_standing = 10 : @pins_standing -= pins
      end
    else  # tenth frame
      rolls[20] = 0 if playing_roll > 19 && !(strike?(9) || spare?(9))
      pins == pins_standing ? @pins_standing = 10 : @pins_standing -= pins
    end
  end

  def score
    points = 0
    for frame in 0..9
      if strike? (frame)
        points += 10 + bonus_strike(frame)
      elsif spare? (frame)
        points += 10 + bonus_spare(frame)
      else
        points += frame_points(frame)
      end
    end
    points
  end

  def print_score
    puts "Score: " + score.to_s
    puts "Rolls: " + rolls.to_s
  end

  private

  def bonus_spare(frame)
    rolls[2*frame+2].to_i
  end

  def bonus_strike(frame)
    if frame < 9
      rolls[2*frame+2].to_i + if strike? (frame+1)
                                rolls[2*frame+4].to_i
                              else
                                rolls[2*frame+3].to_i
                              end
    else  # tenth frame
      rolls[2*frame+1].to_i + rolls[2*frame+2].to_i
    end
  end

  def frame_points(frame)
    rolls[2*frame].to_i + rolls[2*frame +1].to_i
  end

  def game_over?
    rolls.find_index(nil) == nil
  end

  def playing_roll
    rolls.find_index(nil).to_i
  end

  def spare? (frame)
    rolls[2*frame].to_i + rolls[2*frame+1].to_i == 10
  end

  def strike? (frame)
    rolls[2*frame].to_i == 10
  end
end
