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

      it "returns a new scoreboard with updated frames" do
        expect(scoreboard.record_roll(4).frames).to eq [
          CompleteFrame.new(5),
          CompleteFrame.new(6),
        ]
      end
    end

    context "when all ten frames are complete" do
      subject(:scoreboard) { Scoreboard.new [
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        CompleteFrame.new(1),
        SpareFrame.new(10),
      ] }

      it "returns a new scoreboard with updated frames" do
        expect(scoreboard.record_roll(4).frames).to eq [
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(1),
          CompleteFrame.new(14),
        ]
      end
    end

    context "when the last frame is complete, but there are still frames left to bowl" do
      subject(:scoreboard) {
        Scoreboard.new [SpareFrame.new(10)]
      }

      context "and fewwer than ten pins have been knocked down" do
        it "returns a new scoreboard with updated frames and a new incomplete frame" do
          expect(scoreboard.record_roll(4).frames).to eq [
            CompleteFrame.new(14),
            IncompleteFrame.new(4),
          ]
        end
      end

      context "and all ten pins have been knocked down" do
        it "returns a new scoreboard with updated frames and a new strike frame" do
          expect(scoreboard.record_roll(10).frames).to eq [
            CompleteFrame.new(20),
            StrikeFrame.new(10),
          ]
        end
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
