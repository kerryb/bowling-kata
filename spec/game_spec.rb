require "game"

describe Game do
  subject(:game) { Game.new }

  describe "A gutter game (all zeroes)" do
    it "scores 0" do
      20.times { game.roll 0 }
      expect(game.score).to be_zero
    end
  end

  describe "Rolling all ones" do
    it "scores 20" do
      20.times { game.roll 1 }
      expect(game.score).to eq 20
    end
  end
end
