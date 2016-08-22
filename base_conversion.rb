def convert(input, source, target)

  bin='01'
  oct='01234567'
  dec='0123456789'
  hex='0123456789abcdef'
  allow='abcdefghijklmnopqrstuvwxyz'
  alup='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  alpha='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  alphanum='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  alpha_extended = ('a'..'z').to_a + ('a'..'z').to_a.map { |c| c + c }

  bases = { dec => 10, bin => 2, oct => 8, hex => 16 }
  base = bases[source]
  case target
  when dec # dec
    return input.to_i(base).to_s(10)
  when bin # bin
    return input.to_i.to_s(2)
  when oct # oct
    return input.to_i.to_s(8)
  when hex # hex
    return input.to_i(base).to_s(16) unless base.nil?
    return input.to_i(10)
  when alpha
    return alpha.split(//)[input.to_i]
  when allow
    return alpha_extended[input.to_i]
  else
    puts "Oh no!"
  end
end
# ==> nil


bin='01'
# ==> "01"
oct='01234567'
# ==> "01234567"
dec='0123456789'
# ==> "0123456789"
hex='0123456789abcdef'
# ==> "0123456789abcdef"
allow='abcdefghijklmnopqrstuvwxyz'
# ==> "abcdefghijklmnopqrstuvwxyz"
alup='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
# ==> "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
alpha='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
# ==> "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphanum='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
# ==> "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

convert("hello", allow, hex)
# ==> 0
