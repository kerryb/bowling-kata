class Game
  attr_accessor :score

  def initialize
    @score = 0
    @frame = []
    @spare = false
    @strike = 0
  end

  def roll pins
    @score += pins
    if @spare
      @score += pins
      @spare = false
    end

    if @strike > 0
      @score += pins
      @strike -= 1
    end

    @frame << pins
    if @frame.size == 2
      @spare = (@frame.inject(&:+) == 10)
      @frame = []
    elsif @frame == [10]
      @strike = 2
      @frame = []
    end
  end
end
