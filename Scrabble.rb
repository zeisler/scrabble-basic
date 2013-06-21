
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

  def play(word, bounes=:single)
    word.downcase!
    sum = score_by_rules(word)
    sum *= bounes_check bounes
  end

  def bounes_check(bounes)
  bounes = 1 if bounes == :single
  bounes = 2 if bounes == :double
  bounes = 3 if bounes == :triple
  return bounes
end

def score_by_rules(word)
  sum = 0
  @rules.each do |rule, score|
    sum += (score * word.scan(rule).length)
  end
    return sum
end

end






