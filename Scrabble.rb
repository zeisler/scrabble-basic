
class Scrabble

  def initialize
    @rules = {
      /[aeioulnrst]/ => 1,
      /[dg]/ => 2,
      /[bcmp]/ => 3,
      /[fhvwy]/ => 4,
      /[k]/ => 5,
      /[jx]/ => 8,
      /[qz]/ => 10
  }
  end

  def play(word, bonus=:single)
    word.downcase!
    sum = score_by_rules(word)
    sum *= bonus_check bonus
  end

  def bonus_check(bonus)
  bonus = 1 if bonus == :single
  bonus = 2 if bonus == :double
  bonus = 3 if bonus == :triple
  return bonus
end

def score_by_rules(word)
  sum = 0
  @rules.each do |rule, score|
    sum += (score * word.scan(rule).length)
  end
    return sum
end

end






