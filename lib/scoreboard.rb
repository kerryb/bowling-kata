require "complete_frame"
require "incomplete_frame"

Scoreboard = Struct.new :frames do
  def record_roll pins
    if frames.all?(&:complete?)
      Scoreboard.new(frames << IncompleteFrame.new(pins))
    else
      Scoreboard.new updated_frames(pins)
    end
  end

  def score
    frames.map(&:score).reduce(&:+)
  end

  private

  def updated_frames pins
    frames.map {|f| f.update pins }
  end
end
