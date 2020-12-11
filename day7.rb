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

contains_gold = { "shiny gold" => true }

def contains_gold?(bags, contains_gold, bag)
  if contains_gold.has_key?(bag)
    contains_gold[bag]
  else
    bags[bag]
      .any?{ |color, count| contains_gold?(bags, contains_gold, color) }
      .tap{ |bool| contains_gold[bag] = bool }
  end
end

puts (bags.keys.count { |bag| contains_gold?(bags, contains_gold, bag) } - 1)
