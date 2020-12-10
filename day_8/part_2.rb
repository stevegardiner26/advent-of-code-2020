file = File.open("input.txt")
operations = file.readlines

index = 0
@accumulator = 0
visited_indexes = []

while index < operations.length

  type = operations[index].match(/[\w]{3}/).to_s
  num = operations[index].match(/-?[\d]+/).to_s.to_i

  @accumulator += num if type == "acc"

  visited_indexes << index
  @prev_4 = @prev_3
  @prev_3 = @prev_prev
  @prev_prev = @prev
  @prev = index
  if type == "jmp"
    index += num
  else
    index += 1
  end

  if visited_indexes.include? index
    puts @prev_4
    puts operations[@prev_4]
    last_num = operations[@prev].match(/-?[\d]+/).to_s.to_i
    last_method = operations[@prev].match(/[\w]{3}/).to_s
  end
end

puts @accumulator