file = File.open("test.txt")
data = file.readlines.map(&:chomp)


data.map!{ |s| s.gsub('.', '').split(/ contain /) }.map!{ |s| [s[0], s[1].split(', ')] }
@rules = data.to_h

@total_bags = 0
starting_bag = "shiny gold"

def search_bag(goal_bag)
  @rules.each do |key, value|
    if key.include? goal_bag
      sum_bags = 0
      value.each do |item|
        item_count = item.match(/[\d]*/).to_s.to_i
        @total_bags += item_count
        puts item_count
        search_bag(item.match(/[\d]* ([\w ]*)/)[1])
      end
    end
  end
end

search_bag(starting_bag)
print @total_bags
# print @bags.reduce {|p, r| p * r}