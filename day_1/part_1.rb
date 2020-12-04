# Reading the input file, find two numbers that add up to 2020

file = File.open("input.txt")
input_data = file.readlines.map(&:chomp)
hash = []

input_data.each do |num|
  hash[num.to_i] = true
end

input_data.each do |num|
  if hash[2020 - num.to_i]
    @found1 = num
    @found2 = 2020 - num.to_i
  end
end

puts "Numbers that add up to 2020: #{@found1} & #{@found2}"