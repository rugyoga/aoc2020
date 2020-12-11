lines = IO.readlines("day2.txt")
puts lines.count do |line|
  m = /(?<min>\d+)-(?<max>\d+) (?<char>\w): (?<password>\w+)/.match(line.chomp)
  min = m[:min].to_i
  max = m[:max].to_i
  char = m[:char]
  password = m[:password].split("")
  (password[min-1] == char) ^ (password[max-1] == char)
end
