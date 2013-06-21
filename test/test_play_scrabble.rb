require_relative '../scrabble.rb'

require 'minitest/autorun'
require 'minitest/mock'

describe "Play scrabble" do
  before do
    @display_interface = MiniTest::Mock.new
  end
  it "must display output" do
    @display_interface.expect(:display, "Welcome to Scrabble!", ["Welcome to Scrabble!"])
    @display_interface.expect(:display, "Enter a word or a list of words to get score", ["Enter a word or a list of words to get score"])
    @display_interface.expect(:get_input, "Cabbage")
    @display_interface.expect(:display, ["Your score is:"], ["Your score is:"])
    @display_interface.expect(:display, ["14"], [14])
    Play_scrabble.run(@display_interface, false)
  end
end
