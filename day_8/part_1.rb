file = File.open("test2.txt")
operations = file.readlines

index = 0
@accumulator = 0
visited_indexes = []

while index < operations.length

  if visited_indexes.include? index
    break
  end

  type = operations[index].match(/[\w]{3}/).to_s
  num = operations[index].match(/-?[\d]+/).to_s.to_i

  @accumulator += num if type == "acc"

  visited_indexes << index
  if type == "jmp"
    index += num
  else
    index += 1
  end
end

puts @accumulator