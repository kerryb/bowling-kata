require "incomplete_frame"

describe IncompleteFrame do
  it "is not complete" do
    expect(subject).not_to be_complete
  end

  describe "#update" do
    it "returns a complete frame with the score added" do
      frame = IncompleteFrame.new 2
      expect(frame.update 3).to eq CompleteFrame.new(5)
    end
  end
end
