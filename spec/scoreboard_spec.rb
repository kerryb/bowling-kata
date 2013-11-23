require "scoreboard"

describe Scoreboard do
  describe "#record_roll" do
    context "in a new game" do
      subject(:scoreboard) { Scoreboard.new [] }

      it "returns a new scoreboard containing an incomplete frame" do
        expect(scoreboard.record_roll(4).frames).to eq [
          IncompleteFrame.new(4)
        ]
      end
    end

    context "when the last frame is incomplete" do
      subject(:scoreboard) {
        Scoreboard.new [CompleteFrame.new(5), IncompleteFrame.new(2)]
      }

      it "returns a new scoreboard with the frame completed" do
        expect(scoreboard.record_roll(4).frames).to eq [
          CompleteFrame.new(5),
          CompleteFrame.new(6),
        ]
      end
    end

    context "when the last frame is complete" do
      subject(:scoreboard) {
        Scoreboard.new [CompleteFrame.new(5)]
      }

      it "returns a new scoreboard with a new incomplete frame" do
        expect(scoreboard.record_roll(4).frames).to eq [
          CompleteFrame.new(5),
          IncompleteFrame.new(4),
        ]
      end
    end
  end

  describe "#score" do
    it "returns the total score of all frames" do
      scoreboard = Scoreboard.new [
        CompleteFrame.new(2),
        CompleteFrame.new(3),
      ]
      expect(scoreboard.score).to eq 5
    end
  end
end
