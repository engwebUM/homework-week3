class Bowling
  attr_reader :rolls

  def initialize
    @rolls = Array.new(21)
  end

  def roll(pins)
    raise "jogada impossivel" if pins < 0 || pins > 10

    rolls[rolls.find_index(nil)] = pins
  end

  def score
    points = 0
    rolls.each do |roll|
      points += roll.to_i
    end
    points
  end

  def print_score
    puts "Score: " + score.to_s
  end
end
