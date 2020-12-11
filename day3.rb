trees = IO.readlines("day3.txt").map do |line|
  line.chomp.split('').map{ |ch| ch == '#' }
end
puts trees.inspect

x, y = 0, 0
count = 0
 while y < trees.size do
   count += 1 if trees[y][x % trees[y].size]
   x += 3
   y += 1
 end
  puts count
