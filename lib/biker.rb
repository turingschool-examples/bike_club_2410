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
        @rides[ride] ||= []
        @rides[ride] << time
    end
    
end