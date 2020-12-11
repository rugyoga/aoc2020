bags = {}
IO.readlines("day7.txt").each do |line|
  m = /(?<target>.+) bags contain (?<bags>.+)\./.match(line.chomp)
  target = m[:target]
  colors = if m[:bags] == 'no other bags' then
    [] 
  else 
    m[:bags].split(', ').map do |bags|
      match2 = /(?<count>\d+) (?<color>.+) bag.*/.match(bags)
      [match2[:color], match2[:count].to_i]
    end
  end
  bags[target] = colors
end

def count_bags(bags, bag)
  if bags[bag].empty?
    0
  else
    bags[bag].sum{ |color, count| count + count_bags(bags, color) * count }
  end
end

puts count_bags(bags, 'shiny gold')
