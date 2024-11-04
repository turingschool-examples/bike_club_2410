# lib/ride.rb

# The Ride class represents a single biking route or trail. It includes attributes 
# for the name, distance, loop status, and terrain of the ride. Additionally, it 
# provides methods to check if the ride is a loop and to calculate the total distance.
class Ride
    # Using attr_reader to define getter methods for each attribute
  attr_reader :name, :distance, :loop, :terrain
    # Initialize method is called when a new Ride instance is created. It sets up
  # the basic properties of the ride based on the input hash.
  def initialize(details)
    @name = details[:name]       # Name of the ride (e.g., "Walnut Creek Trail")
    @distance = details[:distance] # Base distance of the ride in miles
    @loop = details[:loop]       # Boolean indicating if the ride is a loop
    @terrain = details[:terrain] # Terrain type (e.g., :hills, :gravel)
  end
    # loop? method returns the loop status of the ride.
  # This is a boolean method that checks if the ride is a loop (true) or not (false).
  def loop?
    @loop
  end
    # total_distance method calculates the total biking distance.
  # If the ride is not a loop, it doubles the base distance (out-and-back ride).
  # Otherwise, it returns the base distance (one-way loop).
  def total_distance
    loop? ? distance : distance * 2
  end
end