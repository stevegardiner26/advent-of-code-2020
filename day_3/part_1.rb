=begin
Starting at the top-left corner of your map and following a slope of right 3 and down 1,
how many trees would you encounter? Tree's are represented by a '#'
=end

file = File.open("input.txt")
map_rows = file.readlines.map(&:chomp)

map = map_rows.map{ |r| r.split("") }

travel_length = map.length.to_i
path_width = map[0].length

x = 0
y = 0
trees = 0

while y < (travel_length - 1) do
  x += 3
  y += 1
  if x > (path_width - 1)
    x = x - path_width
  end
  if map[y][x] == '#'
    trees += 1
  end
end

puts "You hit #{trees} trees."