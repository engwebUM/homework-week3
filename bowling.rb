class Bowling
  def roll(pins)
    return "jogada impossivel" if pins < 0 || pins > 10
  end

  def score
    "Score: 0"
  end
end
