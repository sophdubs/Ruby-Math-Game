class Player
  attr_accessor :score, :name
  def initialize()
    @score = 3
  end

  def decrement_score
    @score -= 1
  end
end
