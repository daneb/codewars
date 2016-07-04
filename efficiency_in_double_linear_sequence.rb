# Initial Solution, even tried SortedSet

# $my_array = [1]
# $limit = 0
# $counter = 0

# def dbl_linear(n)
#   generate_sequence(1) if $my_array.length == 1
#   puts $my_array.length
#   puts $my_array[$my_array.length - 1]
#   $my_array[n]
# end

# def generate_sequence(n, counter = 1)
#   35000.times {
#     y = 2 * $my_array[$counter] + 1
#     z = 3 * $my_array[$counter] + 1
#     $my_array << y
#     $my_array << z 
#     $my_array[$counter, $counter + 1] = $my_array[$counter, $counter + 1]
#     $counter = $counter + 1
#   }
#   $my_array.uniq!
#   $my_array.sort_by! { |i| i }
# end

$my_array = [1]
$hash = {} # for uniqueness

def dbl_linear(n)
  generate_sequence(1) if $my_array.length == 1
  puts $my_array.length
  puts $my_array[$my_array.length - 1]
  $my_array[n]
end

def generate_sequence(n)
counter = 0
  300000.times {
    y = 2 * $my_array[counter] + 1
    z = 3 * $my_array[counter] + 1
    unless $hash[y]
      $hash[y] = $my_array.length 
      $my_array << y 
    end
    unless $hash[z]
      $hash[z] = $my_array.length 
      $my_array << z
    end
    counter = counter + 1
  }
  $my_array.sort_by! { |i| i }
end

# Optimized Solution
def dbl_linear(n)
#  array = [1]
#  (n * n.size).times do |i|
#     array << array[i] * 2 + 1
#     array << array[i] * 3 + 1
#   end
#  array.uniq.sort[n]
# end