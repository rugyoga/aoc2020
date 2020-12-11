jolts = IO.readlines("day10.txt").map(&:chomp).map(&:to_i).sort

jolts << jolts.last+3
jolts.unshift(0)
diffs = Hash.new(0)

cache = {}

def count(cache, jolts, i)
    return 1 if i == jolts.size-1
    max = jolts[i]+3
    j = i+1
    n = 0
    while j < jolts.size && jolts[j] <= max do
        n += cached_count(cache, jolts, j)
        j += 1
    end
    n
end

def cached_count(cache, jolts, i)
    return cache[i] if cache[i]
    count(cache, jolts, i).tap{ |c| cache[i] = c }
end

puts cached_count(cache, jolts, 0)