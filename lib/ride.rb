class Ride
  attr_reader :name, :distance, :terrain

  def initialize(ride_data)
    @name = ride_data[:name]
    @distance = ride_data[:distance]
    @loop = ride_data[:loop]
    @terrain = ride_data[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    if loop? == true
      @distance
    else
      @distance * 2
    end
  end
end