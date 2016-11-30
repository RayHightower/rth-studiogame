puts "\n**** Let's keep 'em separated. ****\n\n"
player1 = "larry"
player2 = "curly"
player3 = "moe"
player4 = "shemp"

health1 = 60
health2 = 125
health3 = 100
health4 = 90

start_time = Time.new

puts "#{player1.capitalize} has a health of #{health1}."
puts "#{player2.upcase} has a health of #{health2}."
puts "#{player3.capitalize} has a health of #{health3}.".center(50,'*')
puts "#{player4.capitalize.ljust(40,'.')} #{health4} health"

puts "\n\nThe game started on #{start_time.strftime("%A %m/%d/%Y at%l:%M%p")}"

puts "\n**** Let's keep 'em separated. ****\n"
def fmt_time
  current_time = Time.new
  formatted_time = current_time.strftime("%H:%M:%S")
end

def say_hello(name="generic", health = 100)
  "I'm #{name.capitalize} with a health of #{health} as of #{fmt_time}."
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)

puts "\n**** Let's keep 'em separated. ****\n"

player = %w["larry", "curly", "moe"]
health = %w[60, 85, 129]

player1health = 60

puts "#{player[1]}\'s health is #{health[1]}"

player.each do |this_one|
  puts "#{this_one}\'s health is #{health[1]}"
end

puts "Now, let's triple #{player1}\'s health."

player1health *= 3

puts "#{player1}\'s health is #{player1health}"


