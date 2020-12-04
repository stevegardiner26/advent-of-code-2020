=begin
Determine the number of trees you would encounter if, for each of the following slopes,
you start at the top-left corner and traverse the map all the way to the bottom:
Right 1, down 1.
Right 3, down 1. (This is the slope you already checked.)
Right 5, down 1.
Right 7, down 1.
Right 1, down 2.
=end

file = File.open("input.txt")
map_rows = file.readlines.map(&:chomp)

map = map_rows.map{ |r| r.split("") }

travel_length = map.length.to_i
path_width = map[0].length

move_sets = [{x: 1, y: 1}, {x: 3, y: 1}, {x: 5, y: 1}, {x: 7, y: 1}, {x: 1, y: 2}]

move_sets.each do |ms|
  x = 0
  y = 0
  trees = 0

  while y < (travel_length - 1) do
    x += ms[:x]
    y += ms[:y]
    if x > (path_width - 1)
      x = x - path_width
    end
    if map[y][x] == '#'
      trees += 1
    end
  end

  puts "You hit #{trees} trees by going right #{ms[:x]} and down #{ms[:y]}."
end