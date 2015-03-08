class Frame

  def initialize
    @scores = Array.new(Bowling::MAX_ATTEMPTS_PER_FRAME)
    @noOfPins = Bowling::MAX_PINS
    @noAttempts = 0
  end

  def isSpare
    firstAttempt < Bowling::MAX_PINS && score == Bowling::MAX_PINS
  end

  def isStrike
    firstAttempt == Bowling::MAX_PINS
  end

  def isDone
    @noAttempts == Bowling::MAX_ATTEMPTS_PER_FRAME
  end

  def setScore(pins = 0)
    raise 'Number of pins exceeded' if @noOfPins - pins < 0

    @scores[@noAttempts] = pins
    @noAttempts += 1
    @noOfPins -= pins #remaining pins
    @noAttempts += 1 if firstAttempt == Bowling::MAX_PINS #complete frame attempts
  end

  def firstAttempt
    validAttempt(@scores[0])
  end

  def score
    validAttempt(@scores[0]) + validAttempt(@scores[1])
  end

  private
  def validAttempt(num)
    num.nil? ? 0 : num.to_i
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
    @extraBalls = 0
    @frames = Array.new(MAX_FRAMES + 2){ Frame.new }
  end

  def roll(pins=MIN_PINS)
    raise 'Invalid number of pins' if pins > MAX_PINS || pins < MIN_PINS
    frame = getFrame
    raise 'All attempts exhausted - start new game' if getFrame == nil
    frame.setScore(pins)

    if frameCounter >= MAX_FRAMES #bonus
        raise 'Extra balls exceeded - start new game' if @extraBalls == 0
        @extraBalls -= 1
    end
  end

  def score
    score = 0

    if frameCounter == MIN_FRAMES
      return getCurrentFrame.score
    else
      frameCounter > MAX_FRAMES - 2 ? max = MAX_FRAMES - 2 : max = frameCounter # find max
      for i in 0..max
        score += frames[i].score
        if frames[i].isStrike
          score += closeTwoBallsScore(i)
        elsif frames[i].isSpare
          score += closeFrame(i).firstAttempt
        end
      end

      if frameCounter >= MAX_FRAMES - 1 #bonus frame score
        for i in MAX_FRAMES - 1..frameCounter
          score += frames[i].score
        end
      end
      score
    end
  end

  private

  def closeFrame(currentFramNumber)
    frames[currentFramNumber + 1]
  end

  def closeTwoBallsScore(currentFramNumber)
    closeFrame = closeFrame(currentFramNumber)
    closeFrame.isStrike ? closeFrame.score + closeFrame(currentFramNumber + 1).firstAttempt : closeFrame.score
  end

  def getFrame
    frame = getCurrentFrame

    if frame.isDone
      if isLastFrame
        if !(frame.isSpare || frame.isStrike)
          return nil
        elsif frame.isStrike
          @extraBalls = 2
        elsif frame.isSpare
          @extraBalls = 1
        end
      end
      @frameCounter += 1
      frame = getCurrentFrame
    end
    frame
  end

  def getCurrentFrame
    frames[frameCounter]
  end

  def isLastFrame
    frameCounter == MAX_FRAMES - 1
  end
end
