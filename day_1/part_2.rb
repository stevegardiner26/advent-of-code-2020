# Reading the input file, find three numbers that add up to 2020

file = File.open("input.txt")
input_data = file.readlines.map(&:chomp)

hash = []

input_data.each do |i|
  input_data.each do |j|
    key = 2020 - i.to_i - j.to_i
    if key > 0
      hash[key] = {found1: i.to_i, found2: j.to_i}
    end
  end
end

input_data.each do |num|
  num = num.to_i
  if hash[num]
    @found1 = hash[num][:found1]
    @found2 = hash[num][:found2]
    @found3 = num
  end
end

puts "Three numbers that add up to 2020: #{@found1} & #{@found2} & #{@found3}"