require "spare_frame"

StrikeFrame = Struct.new :score do
  def complete?
    true
  end

  def update pins
    SpareFrame.new score + pins
  end
end
