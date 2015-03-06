# ILUSTRES COLEGAS:
#
# PEÇO-VOS QUE RESISTAM À TENTAÇÃO DE FAZER UM COPY&PASTE INTEGRAL DESTE CÓDIGO,
# SOB PENA DE NOS SER ATRIBUÍDA A CLASSIFICAÇÃO 0*.

class Bowling
  def initialize
    @score = 0
    @current_frame = 1
    @current_frame_score = nil
    @bonus = [0, 0]
  end

  def roll(pins)
    if @current_frame > 11 || @bonus[0] == nil
      return
    end

    @score += pins * (1 + @bonus[0])
    @bonus.shift

    if @current_frame < 10
      @bonus.push(0)
    end

    case
    when pins==10 && (@current_frame_score == nil || @current_frame == 10 && @current_frame_score == 10)
      if @bonus[0] != nil
        @bonus[0] += 1
      end
      if @bonus[1] != nil
        @bonus[1] += 1
      end
      if @current_frame == 10 && @current_frame_score == nil
        @bonus.push(0)
      end
    when @current_frame_score != nil && @current_frame_score + pins == 10 && @current_frame_score != 10
      if @bonus[0] != nil
        @bonus[0] += 1
      end
      if @current_frame == 10
        @bonus.push(0)
      end
    end

    if @current_frame_score != nil || pins == 10
      next_frame
    else
      @current_frame_score = pins
    end
  end

  def score
    @score
  end

  private

  def next_frame
    @current_frame_score = nil
    @current_frame += 1
  end
end
