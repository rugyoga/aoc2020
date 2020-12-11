cards = IO.readlines("day5.txt").map(&:chomp).map{ |bc| bc.gsub(/(F|L)/, '0').gsub(/(B|R)/, '1').to_i(2) }

puts cards.max