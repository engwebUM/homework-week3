class Frame
  attr_reader :scores, :strike, :noAttempts, :noOfPins

  def initialize
    @scores = Array.new(Bowling::MAX_ATTEMPTS_PER_FRAME, 0)
    @noOfPins = 10
    @noAttempts = 0
  end

  def isSpare
    noOfPins = Bowling::MIN_PINS && noAttempts == Bowling::MAX_ATTEMPTS_PER_FRAME && score == Bowling::MAX_PINS
  end

  def isStrike
    noOfPins = Bowling::MIN_PINS && noAttempts == Bowling::MAX_ATTEMPTS_PER_FRAME && firstAttempt == Bowling::MAX_PINS
  end

  def isDone
    noAttempts == Bowling::MAX_ATTEMPTS_PER_FRAME
  end

  def setScore(pins, frameCounter)
    @scores[noAttempts] = pins
    @noAttempts += 1
    @noOfPins -= pins #remaining pins

    if pins == Bowling::MAX_PINS && @noAttempts == 1
    #if normal frame than close frame else reset (tenth) frame pins
     frameCounter < Bowling::MAX_FRAMES - 1 ? @noAttempts += 1 : @noOfPins = 10
    end
  end

  def limitToOneAttempt
    @noAttempts += 1
  end

  def firstAttempt
    scores[0].to_i
  end

  def score
    scores[0] + scores[1].to_i
  end
end

class Bowling

  attr_reader :frames, :frameCounter

  MAX_FRAMES = 10
  MIN_FRAMES = 0
  MAX_PINS = 10
  MIN_PINS = 0
  MAX_ATTEMPTS_PER_FRAME = 2

  def initialize
    @frameCounter = 0
    @frames = Array.new(MAX_FRAMES){ Frame.new }
  end

  # roll the desired number of pins
  def roll(pins)
    raise 'Invalid number of pins' if pins > MAX_PINS || pins < MIN_PINS

    frame = getFrame

    raise 'All attempts exhausted - start new game' if frame == nil

    frame.setScore(pins, frameCounter)

    if isBonusFrame
        frame.limitToOneAttempt
    end
  end

  # return the current score
  def score

  end
end
