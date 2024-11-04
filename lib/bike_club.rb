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
        most = @bikers.max_by do |biker| 
            biker.rides.count
        end
        most
    end

end