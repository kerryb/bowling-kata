require "complete_frame"
require "incomplete_frame"
require "strike_frame"

Scoreboard = Struct.new :frames do
  def record_roll pins
    updated_frames = update_frames pins
    if new_frame? 
      Scoreboard.new(updated_frames << new_frame(pins))
    else
      Scoreboard.new updated_frames
    end
  end

  def score
    frames.map(&:score).reduce(&:+)
  end

  private

  def new_frame?
    frames.size < 10 && frames.all?(&:complete?)
  end

  def update_frames pins
    frames.map {|f| f.update pins }
  end

  def new_frame pins
    if pins == 10
      StrikeFrame.new pins
    else
      IncompleteFrame.new(pins)
    end
  end
end
