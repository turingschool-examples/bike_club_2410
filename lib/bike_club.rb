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
    biker_total_rides = {}
    @bikers.each do |biker|
      biker_total_rides[biker] = 0
      biker.rides.each do |ride|
        biker_total_rides[biker] += ride[1].count
      end
    end

    most_rides = biker_total_rides.max_by do |biker| 
      biker[1]
    end

    most_rides[0]
  end

  def best_time(ride)
    
    eligible_bikers = @bikers.find_all do |biker|
      biker_ride = biker.rides.keys
      biker_ride.include?(ride)
    end

    best_timed = eligible_bikers.min_by do |biker|
      biker.personal_record(ride)
      
    end
    
    best_timed
  end

 
end