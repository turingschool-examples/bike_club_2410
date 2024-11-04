class BikeClub

    attr_reader :name,
                :bikers

    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        @bikers << biker
        @bikers
    end

    def most_rides
        @bikers.max_by do |biker|
            biker.rides.count
        end
    end
    
    def best_time(ride)
        @bikers.min_by do |biker|
            biker.rides.fetch_values(ride)
        end
    end

    def bikers_eligible(ride)
        @bikers.find_all do |biker|
            biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance >= ride.total_distance
        end
    end

    # def self.record_group_ride(ride)
    #     @@group_ride = {
    #         start_time: Time.new(2024, 11, 4),
    #         ride: ride,
    #         members: @bikers
    #     }
    # end
end