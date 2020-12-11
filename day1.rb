v = IO.readlines("day1.txt").map(&:to_i)
n = v.size
for i in 0..(n-1) do
  for j in  i..(n-1) do
    puts v[i] * v[j] if v[i] + v[j] == 2020
  end
end
