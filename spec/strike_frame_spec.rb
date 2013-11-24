require "strike_frame"

describe StrikeFrame do
  it "is complete" do
    expect(subject).to be_complete
  end

  describe "#update" do
    subject { StrikeFrame.new 10 }

    it "returns a spare frame with the score added" do
      expect(subject.update 3).to eq SpareFrame.new(13)
    end
  end
end
