FLOOR = '.'
OCCUPIED = '#'
EMPTY = 'L'

def count(seats)
    seats.map{ |row| row.count{ |seat| seat == OCCUPIED } }.sum
end

def valid?(seats, i, j)
    0 <= i && 0 <= j && i < seats.size && j < seats[i].size
end

def occupied(seats, i, j)
    count = 0
    [[-1,-1], [0, -1], [1, -1],
     [-1, 0],          [1, 0],
     [-1, 1], [0, 1],  [1, 1]].each do |x, y|
        m = i+x
        n = j+y
        while valid?(seats, m, n) && seats[m][n] == FLOOR do
            m += x
            n += y
        end
        count += 1 if valid?(seats, m, n) && seats[m][n] == OCCUPIED
     end
     count#.tap{ |c| puts "occupied( #{i}, #{j} ) => #{c}" }
end

def evolve(seats)
    new_seats = seats.map{ |row| row.clone }
    seats.each_with_index do |row, i|
        row.each_with_index do |seat, j|
            next if seat == FLOOR
            n = occupied(seats, i, j)
            if seat == EMPTY && n == 0
                new_seats[i][j] = OCCUPIED
            elsif seat == OCCUPIED && n >= 5
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