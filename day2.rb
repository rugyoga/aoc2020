count = 0
IO.readlines("day2.txt").each do |line|
  puts line
  m = /(?<min>\d+)-(?<max>\d+) (?<char>\w): (?<password>\w+)/.match(line.chomp)
  min = m[:min].to_i
  max = m[:max].to_i
  char = m[:char]
  password = m[:password].split("").group_by{|x| x}
  n = password.fetch(char, []).size
  count += 1 unless n < min || n > max
end
puts count
