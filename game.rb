require_relative "deck.rb"

class Game

  def initialize(deck)
    @deck = deck
  end

  def end_game
    exit
  end

  def start
    greeting
    while deck.cards_left?
      play_round
    end
    end_game
  end

  def play_round
    @card = deck.get_card
    show(@card)
    until next_card?
      user_input = get_user_response
      next_card? = respond_to(user_input)
    end
  end

  def respond_to(user_input)
    if user_input == "[next]"
      return true
    elsif user_input == "[quit]"
      end_game
    elsif user_input == "[help]"
      help_text
      return false
    elsif @card.guess_correct?(user_input)  
      announce_correct
      return true
    else
      announce_incorrect
      return false
    end
  end
  
  def announce_correct
    puts "Correct!"
  end

  def announce_incorrect
    puts "Incorrect!  Try again."
  end

  def get_user_response
    gets.chomp!
  end

  def show(card)
    puts "Definition:"
    puts card.description
  end

  def help_text
    puts "List of commands:"
    puts " [next] selects a new card"
    puts " [help] brings up this menu"
    puts " [quit] exits the program"
  end

  def greeting
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
  end

end



game = Game.new(Deck.new('flashcard_samples.txt'))
game.start
