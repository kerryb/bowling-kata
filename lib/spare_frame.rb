require "complete_frame"

SpareFrame = Struct.new :score do
  def complete?
    true
  end

  def update pins
    CompleteFrame.new score + pins
  end
end
