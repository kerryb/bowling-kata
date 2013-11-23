require "scoreboard"

class Game
  def initialize
    @scoreboard = Scoreboard.new []
  end

  def roll pins
    @scoreboard = @scoreboard.record_roll pins
  end

  def score
    @scoreboard.score
  end
end
