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
    most = @bikers[0]

    @bikers.each do |biker|
      current_most_rides = most.rides.values.flatten.count
      num_of_rides = biker.rides.values.flatten.count

      most = biker if num_of_rides > current_most_rides
    end

    most
  end
end