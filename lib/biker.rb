class Biker
    attr_reader :name,
                :max_distance,
                :rides,
                :acceptable_terrain

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
    end

    def learn_terrain!(new_terrain)
        @acceptable_terrain.append(new_terrain)
    end

    def log_ride(ride, time)
        if @acceptable_terrain.include?(ride.terrain) && @max_distance >= ride.total_distance
            @rides[ride] ||= []
            @rides[ride] << time
        end
    end

    def personal_record(ride)
        if @rides.key?(ride) == true
            @rides[ride].min
        else
            false
        end
    end

end