require_relative '../lib/scrabble.rb'

require 'minitest/autorun'

class Test_Scrable < MiniTest::Unit::TestCase

  def setup
    @scrabble = Scrabble.new
  end
  def test_Scrabble_cabbage_equals_14
    assert_equal 14, @scrabble.play_word("cabbage")
  end
  def test_Scrabble_Cabbage_equals_14
    assert_equal 14, @scrabble.play_word("Cabbage")
  end
  def test_Scrabble_single_word_equals_14
    assert_equal 14, @scrabble.play_word("cabbage", :single)
  end
  def test_Scrabble_double_word_equals_28
    assert_equal 28, @scrabble.play_word("cabbage", :double)
  end
  def test_Scrabble_triple_word_equals_42
    assert_equal 42, @scrabble.play_word("cabbage", :triple)
  end
end
