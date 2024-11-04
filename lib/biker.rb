# lib/biker.rb

class Biker
  # Getter methods for name, max_distance, rides, and acceptable_terrain
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  # Initialize with name, max_distance, an empty rides hash, and empty acceptable_terrain array
  def initialize(name, max_distance)
    @name = name                  # Name of the biker (e.g., "Kenny")
    @max_distance = max_distance  # Maximum distance the biker can handle
    @rides = {}                   # Hash to log rides with associated times
    @acceptable_terrain = []      # Array to store acceptable terrain types
  end

  # Adds a new terrain type to the acceptable_terrain array
  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  # Logs a ride if it meets the terrain and distance conditions
  def log_ride(ride, time)
    # Checks if the ride's terrain is acceptable and its total distance is within the max distance
    return unless acceptable_terrain.include?(ride.terrain) && ride.total_distance <= max_distance

    # Logs the time for the ride in the rides hash
    @rides[ride] ||= []  # Initializes an array if no entry exists for the ride
    @rides[ride] << time
  end

  # Finds and returns the best (lowest) time for a specific ride
  # Returns false if no record exists for the ride
  def personal_record(ride)
    @rides[ride]&.min || false
  end
end