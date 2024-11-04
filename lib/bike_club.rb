class BikeClub

    attr_reader :name,
                :bikers

    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        @bikers << biker
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
        # require 'pry'; binding.pry
    end
end