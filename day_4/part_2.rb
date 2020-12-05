file = File.open("input.txt")
passports = file.readlines.join("").split("\n\n")

def values_validated(obj)
  unless obj['byr'].length == 4 && obj['byr'].to_i >= 1920 && obj['byr'].to_i <= 2002
    return false
  end
  unless obj['iyr'].length == 4 && obj['iyr'].to_i >= 2010 && obj['iyr'].to_i <= 2020
    return false
  end
  unless obj['eyr'].length == 4 && obj['eyr'].to_i >= 2020 && obj['eyr'].to_i <= 2030
    return false
  end
  height = obj['hgt'].match(/[\d]*/)[0].to_i
  unless (obj['hgt'].match(/cm/) && height >= 150 && height <= 193) || (obj['hgt'].match(/in/) && height >= 59 && height <= 76)
    return false
  end
  unless obj['hcl'].match(/#[a-f\d]*/)
    return false
  end
  unless obj['pid'].match(/[\d]{9}/)
    return false
  end
  eye_color = false
  %w[amb blu brn gry grn hzl oth].each do |i|
    if i === obj['ecl']
      eye_color = true
    end
  end
  unless eye_color
    return false
  end
  true
end

valid_count = 0
passports.each do |p|
  used = {}
  p.scan(/([\w\d]*):(#?[\w\d]*)/).each do |item|
    unless used.include?(item)
      used[item[0]] = item[1]
    end
  end

  if ((used.length == 7 && !used.include?("cid")) || used.length == 8) && values_validated(used)
    valid_count += 1
  end
end

puts "There are #{valid_count} valid passports"