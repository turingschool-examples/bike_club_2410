# lib/bike_club.rb
class BikeClub
# Methods for name and bikers
attr_reader :name, :bikers

# Initialize with name and an empty bikers array
def initialize(name)
  @name = name          # Name of the bike club
  @bikers = []          # Array to store bikers associated with the club
end

# Adds a new biker to the bikers array
def add_biker(biker)
  @bikers << biker
end

 # Returns the biker with the most logged ride
def most_rides
  @bikers.max_by { |biker| biker.rides.values.flatten.size }
end

# Finds the biker with the best (lowest) time for a specific ride
def best_time(ride)
  eligible_bikers = @bikers.select { |biker| biker.rides.key?(ride) }
  eligible_bikers.min_by { |biker| biker.personal_record(ride) }
end

end