file = File.open("input.txt")
rows = file.readlines

rows.map { |row| row.gsub!(/[FL]/, '0').gsub!(/[BR]/, '1') }

prev = rows.sort[0].to_i(2)
rows.sort.each do |r|
  r = r.to_i(2)
  puts r
  if r - prev > 1
    puts "FOUND ID OF #{r - 1}"
    return
  else
    prev = r
  end
end