class Game
  def initialize
    @rolls = []
  end

  def roll pins
    @rolls << pins
  end

  def score
    state = :first_ball
    frame_score = 0
    total = 0
    @rolls.each do |roll|
      case state
      when :first_ball
        frame_score = roll
        state = :second_ball
      when :second_ball
        frame_score += roll
        total += frame_score
        if frame_score == 10
          state = :spare
        else
          state = :first_ball
        end
      when :spare
        total += roll
        frame_score = roll
        state = :second_ball
      end
    end
    total
  end
end
