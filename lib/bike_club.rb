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
      @bikers.max_by { |biker| biker.rides.values.flatten.size }
    end 
  # .max_by is used for comparisons
    def best_time(ride)
      eligible_bikers = @bikers.select do |biker|
        biker.rides[ride] && !biker.rides[ride].empty?
      end
      eligible_bikers.min_by { |biker| biker.rides[ride].min }
    end
  
    def bikers_eligible(ride)
      @bikers.select do |biker|
        biker.acceptable_terrain.include?(ride.terrain) && ride.distance <= biker.max_distance
# .max_ returns the biker with the maximum distance.
        end
    end

    def start_group_ride(ride)
        @ride_start_time = Time.now
        eligible_bikers = bikers_eligible(ride)
    end

    # def record_group_ride(ride)

    # end
end