file = File.open("input.txt")
passports = file.readlines.join("").split("\n\n")

valid_count = 0
passports.each do |p|
  used = []
  p.scan(/([\w\d]*):[\w\d]*/).each do |item|
    item = item[0]
    unless used.include?(item)
      used.push(item)
    end
  end

  if (used.length == 7 && !used.include?("cid")) || used.length == 8
    valid_count += 1
  end
end

puts "There are #{valid_count} valid passports"