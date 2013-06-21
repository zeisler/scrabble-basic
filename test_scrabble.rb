require_relative 'Scrabble.rb'

require 'minitest/autorun'


describe "Scrabble" do
  before do
    @scrabble = Scrabble.new
  end

  it "must return 14 for word cabbage" do
    @scrabble.play("cabbage").must_equal 14
  end
  it "must return 14 for Cabbage no matter case" do
    @scrabble.play("Cabbage").must_equal 14
  end
  it "must return 14 for word cabbage as a single" do
    @scrabble.play("cabbage", :single).must_equal 14
  end
  it "must return 14 for word cabbage as a double" do
    @scrabble.play("cabbage", :double).must_equal 28
  end
  it "must return 14 for word cabbage as a triple" do
    @scrabble.play("cabbage", :triple).must_equal 42
  end

end
