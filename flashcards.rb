class FlashCard

  attr_reader :description, :answer, :marked

  def initialize(args)
    @description = args[:description]
    @answer = args[:answer]
    @marked = args[:marked] || false
  end

  def guess_correct?(guess)
    @answer == guess
  end

  def mark_card!
    @marked = true
  end

  def marked?
    @marked
  end
end
