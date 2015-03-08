class Bowling
  attr_reader :frames, :current_frame, :score, :count_frames, :count_frame_balls

  def initialize
    @frames = []
    @current_frame = []
    @score = 0
    @count_frames = 0
    @count_frame_balls = 0
  end

  def strike (frame_index)
    strike = []
    strike = @frames[frame_index + 1]
    return 10 + strike[0] + strike[1]
  end

  def spare (frame_index)
    spare = []
    spare = @frames[frame_index + 1]
    return 10 + spare[0]
  end


  def roll(pins)
    if pins == 10 && @current_frame.length == 0
      @current_frame.push(pins)
      @current_frame.push(0)
      @frames.push(current_frame)
      @count_frames += 1
      @current_frame = []
      @count_frame_balls = 0

    elsif @current_frame.length == 1 && @count_frames != 10
      @current_frame.push(pins)
      @frames[count_frames] = @current_frame
      @current_frame = []
      @count_frame_balls = 0
      @count_frames += 1
    else
      @current_frame.push(pins)
      @frames.push(current_frame)
      @count_frame_balls += 1
    end

  end

  def score
    index = 0
    score = 0
    aux_current_frame = []
    @frames.each_index do |i|
      aux_current_frame = @frames[i]
      #strike
      if aux_current_frame[0] == 10
        score += strike (i)
        index +=1
        #sparke
      elsif aux_current_frame.length== 2 && (aux_current_frame[0] + aux_current_frame[1])  == 10
          score += spare (i)

      else
        aux_current_frame.each do |x|
          score += x
        end
      end
    end
  return score
  end


end
