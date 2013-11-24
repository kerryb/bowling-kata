require "incomplete_frame"

describe IncompleteFrame do
  it "is not complete" do
    expect(subject).not_to be_complete
  end

  describe "#update" do
    subject { IncompleteFrame.new 2 }

    context "when the new score is less than ten" do
      it "returns a complete frame with the score added" do
        expect(subject.update 3).to eq CompleteFrame.new(5)
      end
    end

    context "when the new score is ten" do
      it "returns a spare frame with the score added" do
        expect(subject.update 8).to eq SpareFrame.new(10)
      end
    end
  end
end
