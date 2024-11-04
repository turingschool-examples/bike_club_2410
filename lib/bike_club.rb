class BikeClub
  attr_reader :name, :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides #almost just trying to find out how i can shovel the biker with the most rides into array then output it.
    biker_most_rides = [] #also this should proabably not be an array should be a single biker

    @bikers.each do |biker|
      biker.rides.count 

      biker_most_rides << biker
    end
  end
end 