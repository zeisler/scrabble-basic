require_relative 'lib/UI.rb'
require_relative 'lib/Scrabble.rb'
class Play_scrabble

  def self.run(ui=UI, run_loop=true)
     scrabble = Scrabble.new
     ui.display("Welcome to Scrabble!")
    loop do
      ui.display("Enter a word or a list of words to get score")
      input = ui.get_input
      score = scrabble.play_words(input)
      ui.display("Your score is:")
      ui.display(score)
      return true if run_loop == false
    end
  end
end
