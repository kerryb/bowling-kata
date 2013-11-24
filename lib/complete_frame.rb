CompleteFrame = Struct.new :score do
  def complete?
    true
  end

  def update _pins
    self
  end
end
