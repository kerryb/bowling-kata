require "complete_frame"

IncompleteFrame = Struct.new :score do
  def complete?
    false
  end

  def update pins
    CompleteFrame.new score + pins
  end
end
