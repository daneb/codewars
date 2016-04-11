# http://www.codewars.com/kata/5390bac347d09b7da40006f6/train/ruby
class String
  def toJadenClass
    # smarter than .map { |word| word.capitalize! }.join(" ")
    self.split.map(&:capitalize).join(" ")
  end
end