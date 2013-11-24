require "spare_frame"

describe SpareFrame do
  it "is complete" do
    expect(subject).to be_complete
  end

  describe "#update" do
    subject { SpareFrame.new 10 }

    it "returns a complete frame with the score added" do
      expect(subject.update 3).to eq CompleteFrame.new(13)
    end
  end
end
