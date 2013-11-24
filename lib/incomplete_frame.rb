require "complete_frame"
require "spare_frame"

IncompleteFrame = Struct.new :score do
  def complete?
    false
  end

  def update pins
    total = score + pins
    if total == 10
      SpareFrame.new total
    else
      CompleteFrame.new total
    end
  end
end
