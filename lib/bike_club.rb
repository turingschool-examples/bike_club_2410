class BikeClub
    
    attr_reader :name,
                :bikers

    def initialize(name, bikers = [])
        @name = name
        @bikers = bikers
    end

    def add_bikers(biker)
        bikers << biker
    end

    def biker_most_rides
        bikers.each do |biker|
            if biker.ride.keys.count
                #need to compare the different counts and determin the hights
                #do an each cons?
            end
        end
    end

end