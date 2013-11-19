class Game
  attr_accessor :score

  def initialize
    @score = 0
    @frame = []
    @frame_count = 0
    @spare = false
    @strike_bonuses = []
  end

  def roll pins
    @score += pins
    if @spare
      @score += pins
      @spare = false
    end

    if multiplier = @strike_bonuses.shift
      @score += pins * multiplier
    end

    @frame << pins
    if @frame.size == 2
      @spare = (@frame.inject(&:+) == 10 && @frame_count <= 10)
      new_frame
    elsif @frame == [10]
      if @frame_count <= 8 #FIXME: Why 8? This is almost certainly wrong!
        if @strike_bonuses.empty?
          @strike_bonuses = [1, 1]
        else
          @strike_bonuses[0] += 1
          @strike_bonuses.push 1
        end
      end
      new_frame
    end
  end

  private

  def new_frame
    @frame_count += 1
    @frame = []
  end
end
