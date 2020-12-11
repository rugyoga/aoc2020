fields = %w(byr iyr eyr hgt hcl ecl pid) 
passports = File.read("day4.txt").split("\n\n").map{ |p| Hash[p.gsub("\n",' ').split(' ').map{ |kv| kv.split(':') }] }
EYES = %w(amb blu brn gry grn hzl oth)
p = passports.count do |passport|
  byr = passport['byr'].to_i
  iyr = passport['iyr'].to_i
  eyr = passport['iyr'].to_i
  hcl = /^[a-f0-9]{6}$/.match(passport['hcl'])
  ecl = EYES.member?(passport['ecl'])
  pid = /^\d{9}$/.match(passport['pid'])
  fields.all?{ |field| passport.has_key?(field) } &&
    1920 <= byr && byr <= 2002 &&
    2010 <= iyr && iyr <= 2020 &&
    2020 <= eyr && eyr <= 2030 &&
    height?(passport['hgt']) &&
    hcl &&
    ecl &&
    pid
  false
end

puts p

def inches?(h)
  m = /(?<dim>\d+)in/.match(h)
  dim = m[:dim].to_i
  59 <= dim && dim <= 76
end

def cm?(h)
  m = /(?<dim>\d+)cm/.match(h)
  dim = m[:dim].to_i
  150 <= dim && dim <= 193
end

def height?(h)
  return inches?(h) if h.ends_with('in')
  return cm?(h)     if h.ends_with('cm')
  false
end
