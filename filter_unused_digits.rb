# Test.assert_equals(unused_digits(12, 34, 56, 78), "09")
# Test.assert_equals(unused_digits(2015, 8, 26), "3479")

def unused_digits(*args)
  my_array = ['0','1','2','3','4','5','6','7','8','9']
  result = []
  my_array.each { |arg| result << arg if args.join.count(arg) == 0 }
  result.join
end