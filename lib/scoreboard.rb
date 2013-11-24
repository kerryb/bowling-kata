require "complete_frame"
require "incomplete_frame"

Scoreboard = Struct.new :frames do
  def record_roll pins
    if new_frame? 
      Scoreboard.new(frames << IncompleteFrame.new(pins))
    else
      Scoreboard.new updated_frames(pins)
    end
  end

  def score
    frames.map(&:score).reduce(&:+)
  end

  private

  def new_frame?
    frames.all?(&:complete?)
  end

  def updated_frames pins
    frames.map {|f| f.update pins }
  end
end
