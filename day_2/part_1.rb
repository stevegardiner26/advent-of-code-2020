=begin
Each line gives the password policy and then the password.
The password policy indicates the lowest and highest number of times a given letter must appear
for the password to be valid. For example, 1-3 a means that
the password must contain 'a' at least 1 time and at most 3 times.
Count the amount of valid passwords
=end

file = File.open("input.txt")
input_data = file.readlines.map(&:chomp)

counter = 0

input_data.each do |entry|
  regex = entry.match(/(\d+)\-(\d+) (\w?): (\w+)/)
  min = regex[1].to_i
  max = regex[2].to_i
  char = regex[3]
  password = regex[4]

  char_count = password.count(char)
  if min <= char_count && max >= char_count
    counter += 1
  end
end

puts "There are #{counter} valid passwords"