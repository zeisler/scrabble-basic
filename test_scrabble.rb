require_relative 'lib/Scrabble.rb'

require 'minitest/autorun'


describe "Scrabble" do
  before do
    @scrabble = Scrabble.new
  end

  it "takes in new rules other than default" do
    rules = {
      /[aeioulnrst]/ => 1,
      /[dg]/ => 4,
      /[bcmp]/ => 3,
      /[fhvwy]/ => 6,
      /[k]/ => 6,
      /[jx]/ => 8,
      /[qz]/ => 20
    }
    Scrabble.new(rules).rules.must_equal rules
  end
  describe "play_word" do
    it "must return 14 for word cabbage" do
      @scrabble.play_word("cabbage").must_equal 14
    end
    it "must return 14 for Cabbage no matter case" do
      @scrabble.play_word("Cabbage").must_equal 14
    end
    it "must return 14 for word cabbage as a single" do
      @scrabble.play_word("cabbage", :single).must_equal 14
    end
    it "must return 14 for word cabbage as a double" do
      @scrabble.play_word("cabbage", :double).must_equal 28
    end
    it "must return 14 for word cabbage as a triple" do
      @scrabble.play_word("cabbage", :triple).must_equal 42
    end
  end

  describe "bonus_check" do
    it "must return 1 for bonus single" do
      @scrabble.bonus_check(:single).must_equal 1
    end
    it "must return 2 for bonus double" do
      @scrabble.bonus_check(:double).must_equal 2
    end
    it "must return 3 for bonus triple" do
      @scrabble.bonus_check(:triple).must_equal 3
    end
  end

  describe "score_by_rules" do
    it "must return 14 for word cabbage" do
      @scrabble.score_by_rules("cabbage").must_equal 14
    end
  end

  describe "play_words" do
    it "takes multiple words and returns a score" do
      @scrabble.play_words("takes multiple words").must_equal 30
    end
    it "ignores punctuation for scoring" do
      @scrabble.play_words("takes , multiple . words !?").must_equal 30
    end
  end

end
