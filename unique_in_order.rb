#Test.assert_equals(unique_in_order('AAAABBBCCDAABBB'), ['A','B','C','D','A','B'])
#Test.assert_equals(unique_in_order('ABBCcAD'), ['A', 'B', 'C', 'c', 'A', 'D'])
#Test.assert_equals(unique_in_order([1,2,2,3,3]), [1,2,3])

def unique_in_order(iterable)
  result = []
  iterable.class == String ?  my_array = iterable.split("") : my_array = iterable
  my_array.each_with_index { |letter, index| result << letter if my_array[index.to_i + 1] != letter }
  result
end