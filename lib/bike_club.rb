# lib/bike_club.rb
class BikeClub
  # Getter methods for name, bikers, and group_rides
  attr_reader :name, :bikers, :group_rides

  # Initialize with name, an empty bikers array, and an empty group_rides array
  def initialize(name)
    @name = name          # Name of the bike club
    @bikers = []          # Array to store bikers associated with the club
    @group_rides = []     # Array to track all group rides
  end

  # Adds a new biker to the bikers array
  def add_biker(biker)
    @bikers << biker
  end

  # Returns the biker with the most logged rides
  def most_rides
    @bikers.max_by { |biker| biker.rides.values.flatten.size }
  end

  # Finds the biker with the best (lowest) time for a specific ride
  def best_time(ride)
    eligible_bikers = @bikers.select { |biker| biker.rides.key?(ride) }
    eligible_bikers.min_by { |biker| biker.personal_record(ride) }
  end

  # Returns an array of bikers eligible for a given ride based on terrain and distance
  def bikers_eligible(ride)
    @bikers.select do |biker|
      biker.acceptable_terrain.include?(ride.terrain) && ride.total_distance <= biker.max_distance
    end
  end

  # Adds `record_group_ride` method to start a group ride and track start and finish times
  def record_group_ride(ride)
    start_time = Time.now
    participants = bikers_eligible(ride)
    
    # Log each participant's finish time by calculating time difference
    participants.each do |biker|
      finish_time = start_time + (rand(20..60) * 60) # Random finish times between 20 and 60 minutes
      ride_duration = (finish_time - start_time) / 60
      biker.log_ride(ride, ride_duration)
    end

    # Store the ride details in a hash for group rides tracking
    @group_rides << { start_time: start_time, ride: ride, members: participants }
  end

  # Class method to find the biker with the best time for a ride across all BikeClub instances
  def self.best_rider(ride)
    best_time_biker = nil
    best_time = Float::INFINITY

    # Iterate through each biker's rides and update if a better time is found
    ObjectSpace.each_object(BikeClub) do |club|
      club.bikers.each do |biker|
        if biker.rides[ride]
          biker_best_time = biker.personal_record(ride)
          if biker_best_time && biker_best_time < best_time
            best_time = biker_best_time
            best_time_biker = biker
          end
        end
      end
    end

    best_time_biker
  end
end