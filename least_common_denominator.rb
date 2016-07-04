#Test.assert_equals(convertFracts([[1, 2], [1, 3], [1, 4]]), [[6, 12], [4, 12], [3, 12]])

def convertFracts(lst)
  result = []
  denom = lst.map { |pair| pair[1] }
  lcd = denom.inject(1) { |result, int| result = result.lcm(int) }
  lst.each { |pair| result << [pair[0] * lcd / pair[1], lcd ] }
  result
end

### mateusdelbianco
# def convertFracts(lst)
#  lcm = lst.reduce(1) { |x,y| x.lcm(y[1]) }
#  lst.map { |x| [lcm/x[1]*x[0], lcm] }
# end