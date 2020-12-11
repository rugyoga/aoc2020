passports = puts File.read("day4.txt").split("\n\n").size #.map{|p| p.gsub("\n", " ")}
exit
required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

# Part 1
valid_passports1 = passports.select do |p|
	p.split(" ").select do |field| 
		required_fields.include?(field.split(":").first)
	end.length == required_fields.length
end
puts "#{valid_passports1.length}"
