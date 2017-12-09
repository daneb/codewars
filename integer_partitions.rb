$result = []

def partition(n, max, prefix)
  if n == 0
    $result << prefix.split.map{|x| x.to_i}
    return 
  end
  ([max, n].min).downto(1) do |i|
    partition(n-i, i, "#{prefix} #{i}")
  end
end

def find_product_of_partitions(n)
  partition(n, n, '')
  result = $result.map { |sub_array| sub_array.reduce(:*) }  # !> assigned but unused variable - result
end

def mean(array)
  (array.reduce(:+) / array.count.to_f).round_point5
end

def median_of(a)
  return nil if a.empty?
  sorted = a.sort
  len = sorted.length
  median = ((sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0).to_f
  median.round_point5
end

class Float
  def round_point5
    (self * 2).to_f.ceil / 2.0
  end
end

def part(n)
  products = find_product_of_partitions(n)
  range = products.max - products.min
  average = mean(products)
  median = (median_of products)
  "Range: #{range} Average: #{format("%.2f", average)} Median: #{format("%.2f", median)}"
end

4.times { p "Hello"}         
