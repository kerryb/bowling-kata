class Game
  attr_accessor :score

  def initialize
    @scores = []
  end

  def roll pins
    @scores << pins
  end

  def score
    @scores.inject :+
  end
end
