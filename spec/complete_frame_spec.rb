require "complete_frame"

describe CompleteFrame do
  it "is complete" do
    expect(subject).to be_complete
  end

  describe "#update" do
    it "returns the frame unchanged" do
      expect(subject.update 3).to be subject
    end
  end
end
