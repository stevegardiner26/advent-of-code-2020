file = File.open("input.txt")
rows = file.readlines

rows.map { |row| row.gsub!(/[FL]/, '0').gsub!(/[BR]/, '1') }
puts rows.max.to_i(2)