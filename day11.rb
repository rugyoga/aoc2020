FLOOR = '.'
OCCUPIED = '#'
EMPTY = 'L'

def count(seats)
    seats.map{ |row| row.count{ |seat| seat == OCCUPIED } }.sum
end

def neighbours(seats, i, j)
    results = Hash.new(0)
    [[-1,-1], [0, -1], [1, -1],
     [-1, 0],          [1, 0],
     [-1, 1], [0, 1],  [1, 1]].each do |x, y|
        m = i+x
        n = j+y
        next if m < 0 || n < 0 || m >= seats.size || n >= seats[i].size
        results[seats[m][n]] += 1
     end
     results
end

def evolve(seats)
    new_seats = seats.map{ |row| row.clone }
    seats.each_with_index do |row, i|
        row.each_with_index do |seat, j|
            next if seat == FLOOR
            n = neighbours(seats, i, j)
            if seat == EMPTY && n[OCCUPIED] == 0
                new_seats[i][j] = OCCUPIED
            elsif seat == OCCUPIED && n[OCCUPIED] >= 4
                new_seats[i][j] = EMPTY
            end
        end
    end
    new_seats
end

def display(seats)
    #seats.each{ |row| puts row.join('') }
    #puts
end

seats = IO.readlines("day11.txt").map{|l| l.chomp.split('') }
new_seats = evolve(seats)
display(seats)
while seats != new_seats do
    display(new_seats)
    seats = new_seats
    new_seats = evolve(seats)
end

puts count(seats)