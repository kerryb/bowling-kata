require "game"

describe Game do
  subject(:game) { Game.new }

  describe "A gutter game" do
    it "scores zero" do
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

  describe "Scoring a spare" do
    it "adds a bonus of the number of pins from the next roll" do
      2.times { game.roll 5 }
      game.roll 3
      17.times { game.roll 0 }
      expect(game.score).to eq 16
    end
  end

  describe "Scoring a strike" do
    it "adds a bonus of the number of pins from the next two rolls" do
      game.roll 10
      game.roll 3
      game.roll 4
      16.times { game.roll 0 }
      expect(game.score).to eq 24
    end
  end
end
