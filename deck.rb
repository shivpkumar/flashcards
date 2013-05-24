class Deck
  def initialize(file)
    @file = file
    @deck = []
    parse_file
  end

  def parse_file
    flashcard_list = File.readlines(@file)
    until flashcard_list.length == 0
      flashcard = flashcard_list.shift(3)
      description = flashcard[0].delete("\n")
      answer = flashcard[1].delete("\n")
      @deck << Flashcard.new({description: description, answer: answer})
    end
  end

  def get_card
   @deck.shuffle!
   @deck.find { |card| card.marked? == false }
  end
end
