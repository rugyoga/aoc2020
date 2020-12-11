fields = %w(byr iyr eyr hgt hcl ecl pid) 
passports = File.read("day6.txt").split("\n\n").map{ |p| p.gsub("\n",'').split('').uniq.size }
puts passports.sum
