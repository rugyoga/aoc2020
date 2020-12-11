require 'set'

def execute(instructions)
    accumulator = 0
    executed = Set.new
    i = 0
    while !executed.member?(i) do
        executed.add(i)
        case instructions[i][0]
        when "nop"
            i += 1
        when "acc"
            accumulator += instructions[i][1]
            i += 1
        when "jmp"
            i += instructions[i][1]
        end
        return [true, accumulator] if i >= instructions.size
    end
    [false, accumulator]
end

def try_all(instructions)
    i = 0
    success, accumulator = false, nil
    until success do
        case instructions[i].first
        when"acc"
        when "jmp"
            instructions[i][0]  = "nop"
            success, accumulator = execute(instructions)
            instructions[i][0]  = "jmp"
        when "nop"
            instructions[i][0]  = "jmp"
            success, accumulator = execute(instructions)
            instructions[i][0]  = "nop"
        end
        i += 1
    end
    accumulator
end

instructions = IO.readlines("day8.txt").map{|l| l.chomp.split(" ").tap{ |v| v[1] = v[1].to_i }}
puts execute(instructions)[1]