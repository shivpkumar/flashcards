class FlashCard

  attr_reader :question, :marked

  def initialize(args)
    @question = args[:question]
    @answer = args[:answer]
    @marked = args[:marked] || false
  end

  def guess_correct?(guess)
    @answer == guess
  end

  def mark_card!
    @marked = true
  end

end
