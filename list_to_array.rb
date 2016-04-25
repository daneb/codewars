# Test.describe("Basic tests") do
# lists = [
#   {'value'=>1, 'next'=>{'value'=>2, 'next'=>{'value'=>3, 'next'=>nil}}},
#   {'value'=>"string", 'next'=>nil},
#   {'value'=>true, 'next'=>{'value'=>false, 'next'=>{'value'=>"true", 'next'=>{'value'=>"false", 'next'=>nil}}}},
#   {'value'=>1, 'next'=>{'value'=>1, 'next'=>{'value'=>1, 'next'=>{'value'=>1, 'next'=>{'value'=>1, 'next'=>{'value'=>1, 'next'=>nil}}}}}},
#   {'value'=>"foo", 'next'=>{'value'=>"bar", 'next'=>nil}}
# ]
# Test.assert_equals(list_to_array(lists[0]), [1, 2, 3])
# Test.assert_equals(list_to_array(lists[1]), ["string"])
# Test.assert_equals(list_to_array(lists[2]), [true, false, "true", "false"])
# Test.assert_equals(list_to_array(lists[3]), [1, 1, 1, 1, 1, 1])
# Test.assert_equals(list_to_array(lists[4]), ["foo", "bar"])
# end


def list_to_array(list, result=[])
  result << list["value"]
  return result if list["next"].nil?
  list_to_array(list["next"], result)
end