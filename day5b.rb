IO.readlines("day5.txt")
.map{ |bc| bc.chomp.gsub(/(F|L)/, '0').gsub(/(B|R)/, '1').to_i(2) }
.sort
.each_cons(2) do |a,b|
    next if a+1 == b
    puts a+1
end