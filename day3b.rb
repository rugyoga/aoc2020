trees = IO.readlines("day3.txt").map do |line|
  line.chomp.split('').map{ |ch| ch == '#' }
end

def counter(trees, x_delta, y_delta)
  x, y = 0, 0
  count = 0
   while y < trees.size do
     count += 1 if trees[y][x % trees[y].size]
     x += x_delta
     y += y_delta
   end
   count
end

puts [[1,1], [3,1], [5,1], [7,1], [1,2]].map{ |x, y| counter(trees, x, y) }.reduce(:*)
