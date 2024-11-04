# bike_app_logic.rb
require 'pry'
require './lib/ride'
require './lib/biker'
require './lib/bike_club'

# Example of creating rides
ride1 = Ride.new({ name: "Black Creek Trail", distance: 10.7, loop: false, terrain: :hills })
ride2 = Ride.new({ name: "Cape Town Lake", distance: 14.9, loop: true, terrain: :gravel })

# Check ride details
puts "Ride 1 Total Distance: #{ride1.total_distance}"
puts "Ride 2 Total Distance: #{ride2.total_distance}"

# Example of creating a biker and adding terrain preferences
biker = Biker.new("Syre", 30)
biker.learn_terrain!(:hills)
biker.learn_terrain!(:gravel)

# Log rides if they meet terrain and distance requirements
biker.log_ride(ride1, 92.5)
biker.log_ride(ride1, 91.1)
biker.log_ride(ride2, 60.9)

# Inspect the biker's ride logs and personal records
puts "Biker's Personal Record for Ride 1: #{biker.personal_record(ride1)}"
puts "Biker's Ride Logs: #{biker.rides}"

# Drop into a `pry` session to explore further
binding.pry