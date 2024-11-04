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
   @bikers.max_by { |biker| biker.ride_count}
  end

  def best_time(ride)
    @bikers.min_by { |biker| biker.personal_record(ride) }
  end

  def bikers_eligible(ride)
    @bikers.select do |biker|
      biker.acceptable_terrains.include?(ride.terrain) && biker.max_distance >= ride.total_distance
    end
  end
end