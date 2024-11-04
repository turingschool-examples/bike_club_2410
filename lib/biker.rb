class Biker

    attr_reader :name,
                :max_distance,
                :rides,
                :acceptable_terrain

    def initialize(name, max_distance, rides = {}, acceptable_terrain = [])
        @name = name
        @max_distance = max_distance
        @rides = rides
        @acceptable_terrain = acceptable_terrain
    end

    def learn_terrain!(terrain)
        acceptable_terrain << terrain
    end

    def log_ride(ride, time)
        if rides[ride]
            rides[ride] << time
        else
            rides[ride] = [time]
        end
        rides
    end

end