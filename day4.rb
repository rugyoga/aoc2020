fields = %w(byr iyr eyr hgt hcl ecl pid) 
passports = File.read("day4.txt").split("\n\n").map{ |p| Hash[p.gsub("\n",' ').split(' ').map{ |kv| kv.split(':') }] }
puts passports.count { |passport| fields.all?{ |field| passport.has_key?(field) } }
