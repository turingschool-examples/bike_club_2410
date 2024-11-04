# lib/bike_club.rb
class BikeClub
# Methods for name and bikers
attr_reader :name, :bikers

def add_biker(biker)
  @bikers << biker
end

def most_rides
  @bikers.max_by { |biker| biker.rides.values.flatten.size }
end
end