class Scrabble
  attr_reader :rules
  def initialize(rules = nil)
    if rules.nil?
      @rules = {
      /[aeioulnrst]/ => 1,
      /[dg]/ => 2,
      /[bcmp]/ => 3,
      /[fhvwy]/ => 4,
      /[k]/ => 5,
      /[jx]/ => 8,
      /[qz]/ => 10
    }
    else
      @rules = rules
    end
  end

  def play_word(word, bonus=:single)
    word.downcase!
    sum = score_by_rules(word)
    sum *= bonus_check bonus
  end

  def play_words(words)
    sum = 0
    words.split(' ').each do |word|
      sum += play_word(word)
    end
    return sum
  end

  def bonus_check(bonus)
    return 1 if bonus == :single
    return 2 if bonus == :double
    return 3 if bonus == :triple
  end

  def score_by_rules(word)
    sum = 0
    @rules.each do |rule, score|
      sum += (score * word.scan(rule).length)
    end
      return sum
  end

end






