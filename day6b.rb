fields = %w(byr iyr eyr hgt hcl ecl pid) 
passports = File.read("day6.txt").split("\n\n").map do |s|
    ps = s.split("\n")
    n = ps.size
    s.gsub("\n", '').split('').sort.chunk_while{|a,b| a == b }.count{ |chunk| chunk.size == n }
end
puts passports.sum