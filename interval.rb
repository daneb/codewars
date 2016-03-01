def interval_insert (myl, interval)
  union_arr = []
  disjointed_arr = []
  
  myl.each { |disjoints| 
    disjoints.each { |endpoint|
  if ( endpoint => interval[0] && endpoint <= interval[1])
    union_arr << endpoint
  else
    disjoiunted_arr << endpoint
  end
  }
  
  puts union_arr
end


# def interval_insert (myl, interval)
# Use interval to set the condition if (x > y and x < z)
# Pop into array
# At end take first element and last element
# Pop those that are not in another array
# At end take first element and last element
# return as an array with both sets as elements
# end

#  Disjoint sets
# In mathematics, two sets are said to be disjoint if they have no element in common. Equivalently, disjoint sets are sets whose intersection is the empty set.[1] For example, {1, 2, 3} and {4, 5, 6} are disjoint sets, while {1, 2, 3} and {3, 4, 5} are not.

# Interval 
# is a set of real numbers with the property that any number that lies between two numbers in the set is also included in the set. For example, the set of all numbers x satisfying 0 ≤ x ≤ 1 is an interval which contains 0 and 1, as well as all numbers between them

# Closed Interval
Includes it's endpoints. For example (0,5) - means greater than or equal to 0, and less that or equal to 5.

