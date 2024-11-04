# bike_app_logic.rb

require 'pry'
require './lib/ride'
require './lib/biker'
require './lib/bike_club'

# Example of creating rides
ride1 = Ride.new({ name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills })
ride2 = Ride.new({ name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel })

# Display ride details
puts "Ride 1 Total Distance: #{ride1.total_distance}"
puts "Ride 2 Total Distance: #{ride2.total_distance}"

# Example of creating bikers and adding terrain preferences
biker1 = Biker.new("Kenny", 30)
biker2 = Biker.new("Athena", 15)

biker1.learn_terrain!(:hills)
biker1.learn_terrain!(:gravel)
biker2.learn_terrain!(:gravel)

# Log rides for each biker if they meet terrain and distance requirements
biker1.log_ride(ride1, 92.5)
biker1.log_ride(ride1, 91.1)
biker1.log_ride(ride2, 60.9)

biker2.log_ride(ride2, 65.0)

# Check personal records
puts "Biker 1's Personal Record for Ride 1: #{biker1.personal_record(ride1)}"
puts "Biker 2's Personal Record for Ride 2: #{biker2.personal_record(ride2)}"

# Creating a BikeClub and adding bikers
bike_club = BikeClub.new("Mountain Riders")
bike_club.add_biker(biker1)
bike_club.add_biker(biker2)

# Displaying BikeClub details
puts "Bike Club Name: #{bike_club.name}"
puts "Bikers in Club: #{bike_club.bikers.map(&:name).join(', ')}"

# Finding the biker with the most rides
most_active_biker = bike_club.most_rides
puts "Biker with the most rides: #{most_active_biker.name}"

# Finding the best time for a specific ride
best_time_biker = bike_club.best_time(ride2)
puts "Biker with the best time for Ride 2: #{best_time_biker.name}"

# Finding bikers eligible for each ride
eligible_for_ride1 = bike_club.bikers_eligible(ride1).map(&:name)
eligible_for_ride2 = bike_club.bikers_eligible(ride2).map(&:name)

puts "Bikers eligible for Ride 1: #{eligible_for_ride1.join(', ')}"
puts "Bikers eligible for Ride 2: #{eligible_for_ride2.join(', ')}"

# Drop into a `pry` session to explore further if needed
binding.pry