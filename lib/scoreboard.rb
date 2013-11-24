require "complete_frame"
require "incomplete_frame"

Scoreboard = Struct.new :frames do
  def record_roll pins
    if frames.all?(&:complete?)
      Scoreboard.new(frames << IncompleteFrame.new(pins))
    else
      Scoreboard.new frames.map {|f| f.update pins }
    end
  end

  def score
    frames.map(&:score).reduce(&:+)
  end
end
