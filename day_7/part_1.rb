file = File.open("input.txt")
data = file.readlines.map(&:chomp)


data.map!{ |s| s.gsub('.', '').split(/ contain /) }.map!{ |s| [s[0], s[1].split(',')] }
@rules = data.to_h

@bags = []
starting_bag = "shiny gold"

def search_bag(goal_bag)
  @rules.each do |key, value|
    if value.any? { |s| s.include? goal_bag }
      unless @bags.include? key
        @bags.push key
      end
      search_bag(key.match(/([\w ]+ bag)/).to_s)
    end
  end
end

search_bag(starting_bag)
print @bags.count