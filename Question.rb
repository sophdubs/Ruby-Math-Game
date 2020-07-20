class Question
  attr_reader :question, :answer

  def initialize()
    @first = random_number()
    @second = random_number()
    @operator = random_operator()
    @question = "What does #{@first} #{@operator} #{@second} equal?"
    @answer = question_answer()
  end

  def random_number
    return rand(20) + 1
  end

  def random_operator
    operators = ["plus", "minus", "times"]
    return operators[rand(3)]
  end

  def question_answer
    if @operator == "plus"
      return @first + @second
    elsif @operator == "minus"
      return @first - @second
    else
      return @first * @second
    end
  end
end

