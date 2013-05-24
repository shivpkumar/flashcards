#require_relative "decks.rb"

class Game

  deck = Deck.new

  puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"

  #new game query?

  while
    card = deck.get_card
    puts "Definition:"
    puts card.description
    until correct?

      print "Guess: "
      response = gets.chomp!
      
      correct? == card.guess_correct

      if response == "[quit]"
        endgame
      elsif response == "[next]"
        next
      elsif response == "[help]"
        #print the special commands
      elsif not correct?
        puts "Incorrect!  Try again."
      end
    end
    puts "Correct!"
  end

end

Game.new
