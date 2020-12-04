=begin
Each policy actually describes two positions in the password, where 1 means the first character,
2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept
of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences
of the letter are irrelevant for the purposes of policy enforcement.
How many passwords are valid according to the new interpretation of the policies?
=end

file = File.open("input.txt")
input_data = file.readlines.map(&:chomp)

counter = 0

input_data.each do |entry|
  regex = entry.match(/(\d+)\-(\d+) (\w?): (\w+)/)
  pos1 = regex[1].to_i
  pos2 = regex[2].to_i
  char = regex[3]
  password = regex[4]

  if (password[pos1 - 1] == char && password[pos2 - 1] != char) || (password[pos1 - 1] != char && password[pos2 - 1] == char)
    counter += 1
  end
end

puts "There are #{counter} valid passwords"