require_relative '../scrabble.rb'

require 'minitest/autorun'
require 'minitest/mock'

describe "Play scrabble" do
  before do
    @display_interface = MiniTest::Mock.new
  end
  it "must display output" do
    @display_interface.expect(:display, nil, ["Welcome to Scrabble!"])
    @display_interface.expect(:display, nil, ["Enter a word or a list of words to get score"])
    @display_interface.expect(:get_input, "Cabbage")
    @display_interface.expect(:display, nil, ["Your score is:"])
    @display_interface.expect(:display, nil, [14])
    Play_scrabble.run(@display_interface, false)
  end
end
