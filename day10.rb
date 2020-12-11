jolts = IO.readlines("day10.txt").map(&:chomp).map(&:to_i).sort

jolts << jolts.last+3
jolts.unshift(0)
diffs = Hash.new(0)
jolts.each_cons(2){ |a, b| diffs[b-a] += 1 }
puts diffs[1] * diffs[3]