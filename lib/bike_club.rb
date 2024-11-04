require 'pry'

class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    ride_leader = 0
    most_rider = []

    @bikers.each do |biker|
      num_of_ride = biker.rides.values.size

      if num_of_ride > ride_leader
        ride_leader = num_of_ride
        most_rider = [biker]
        binding.pry
      elsif num_of_ride == ride_leader
        most_rider << biker
      end
    end
    most_rider
  end
end