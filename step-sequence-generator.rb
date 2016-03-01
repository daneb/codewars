# Sample
# 10, 20, 10
# 20, 10, 0
# 10, 20, 1


def generator(from, to, step)
    puts from, to, step
      return [] if step <= 0
        return process(from, to, -(step)) if from > to
          process(from, to, step)
end 

def process(from, to, step)
    result = []
      from.step(to, step) { |i|
            result << i
              }
        result
end

