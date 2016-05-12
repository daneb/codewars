# 6 * 21 = 126
# 6 and 21 would be valid 'fangs' for a vampire number as the 
# digits 6, 1, and 2 are present in both the product and multiplicands

# 10 * 11 = 110
# 110 is not a vampire number since there are three 1's in the
# multiplicands, but only two 1's in the product
def vampire_test(a,b)
  "#{a * b}".split('').sort == "#{a}#{b}".split('').sort 
end