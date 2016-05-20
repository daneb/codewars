$my_array = [1]
$limit = 0
$counter = 0

def dbl_linear(n)
  generate_sequence(1) if $my_array.length <= n
  $my_array[n - 1]
end

def generate_sequence(n, counter = 1)
  9000.times {
    y = 2 * $my_array[$counter] + 1
    z = 3 * $my_array[$counter] + 1
    $my_array << y unless $my_array.include?(y)
    $my_array << z unless $my_array.include?(z)
    $my_array[$counter, $counter + 1] = $my_array[$counter, $counter + 1].sort!
    $counter = $counter + 1
  }
end

# def generate_sequence(n, counter = 0)
#   return if $my_array.length >= $limit
#   y = 2 * n + 1
#   z = 3 * n + 1
#   $my_array << y
#   $my_array << z
#   counter = counter + 1
#   $my_array.uniq!
#   $my_array.sort!
#   generate_sequence($my_array[counter], counter)
# end