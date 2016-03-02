def getChar(value)
    count = 0
      for i in ('!'..'~')
              break if value == (33 + count)
                    count = count + 1
                      end
        return i 
end
