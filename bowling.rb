class Bowling
  attr_reader :points

  def initialize
    @points = 0
  end

  def roll(pins)
    raise "jogada impossivel" if pins < 0 || pins > 10

    @points += pins
  end

  def score
    "Score: " + points.to_s
  end

  def print_score
    puts score
  end
end
