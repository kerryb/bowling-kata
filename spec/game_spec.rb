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

  describe "Rolling a spare" do
    it "scores a bonus of the next roll" do
      [5, 5, 3].each {|n| game.roll n }
      17.times { game.roll 0 }
      expect(game.score).to eq 16
    end
  end

  describe "Rolling a strike" do
    it "scores a bonus of the next two rolls" do
      [10, 3, 4].each {|n| game.roll n }
      16.times { game.roll 0 }
      expect(game.score).to eq 24
    end
  end

  describe "Bowling a perfect game" do
    it "scores 300" do
      12.times { game.roll 10 }
      expect(game.score).to eq 300
    end
  end
end
