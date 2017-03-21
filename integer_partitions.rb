def part(n)
  partition(n, n, [])
end

def partition(n, max, prefix)
  result = []
  if n == 0 
    return 
  end
  ([max, n].min).downto(1) do |i|
    partition(n-i, i, prefix << i)
    result << prefix
    prefix = []
  end 
  result
end

part(5)

# def single_op_sum(n)
#   result = []
#   (1..n).each do |outer|
#     sum = 0
#     temp = []
#     (0..n).each do |inner|
#       if sum > n
#         temp = []
#         break
#       end
#       break if sum == n
#       temp << outer
#       sum = sum + outer
#     end
#     result << temp unless temp.empty?
#   end
#   result
# end

# def two_op_sum(n)
#   result = []
#   (0..n).each do |right|
#     (1..n).each do |left|
#       result << [left,right] if left + right == n
#     end
#   end
#   result
# end


# part(5)
