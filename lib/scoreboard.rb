require "complete_frame"
require "incomplete_frame"

Scoreboard = Struct.new :frames do
  def record_roll pins
    if frames.all?(&:complete?)
      Scoreboard.new(frames << IncompleteFrame.new(pins))
    else
      Scoreboard.new(frames[0..-2] << CompleteFrame.new(frames.last.score + pins))
    end
  end

  def score
    frames.map(&:score).reduce(&:+)
  end
end
