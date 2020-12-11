require 'set'

def add(h, a, b)
    h[a + b] += 1 if a != b
end

def remove(h, a, b)
    h[a + b] -= 1 if a != b
    h.delete(a + b) if h[a+b].zero?
end

def detect(numbers, preamble)
    sums = Hash.new(0)
    for i in 0..(preamble-1) do
        for j in i..(preamble-1) do
            add(sums, numbers[i], numbers[j])
        end
    end
    i = 0
    while i+preamble < numbers.size do
        #puts sums.size
        return numbers[i+preamble] unless sums.has_key?(numbers[i+preamble])
        for j in 1..(preamble-1) do
            remove(sums, numbers[i], numbers[i+j])
            add(sums, numbers[i+preamble], numbers[i+j])
        end
        i += 1
    end
end

def find_run(numbers, target)
    i = 0
    j = 1
    sum = numbers[i] + numbers[j]
    puts "target = #{target} sum = #{sum}"
    while sum != target do
        if sum < target
            j += 1
            sum += numbers[j]
            puts "j = #{j} sum = #{sum}"
        else
            i += 1
            sum -= numbers[i-1]
            puts "i = #{i} sum = #{sum}"
        end
    end
    [numbers[i..j].min, numbers[i..j].max]
end

numbers = IO.readlines("day9.txt").map{|l| l.chomp.to_i }
target = detect(numbers, 26)
a, b = find_run(numbers, target)
puts [a, b, a+b]