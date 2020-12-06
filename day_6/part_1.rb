file = File.open("input.txt")

groups = file.read.split("\n\n").map{ |g|
  g.split.map(&:chars)
}

print "Result 1: ",
      groups.map{ |g|
        g.flatten.uniq.count
      }.sum

print "\nResult 2: ",
      groups.map{ |g|
        g.reduce{|pru,item| pru & item}.count
      }.sum