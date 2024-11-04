class Biker
    attr_reader :name, :max_distance, :rides, :acceptable_terrain
    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
    end

    #needs to add terrain to learned terrain
    def learn_terrain!(terrain)
        @acceptable_terrain << terrain unless @acceptable_terrain.include?(terrain)
    end

    #logging time if ride complete and terrain is included
    def log_ride(ride, time)
        if @acceptable_terrain.include?(ride.terrain) && ride.distance <= @max_distance
    
        @rides[ride] ||= []
        @rides[ride] << time
        end
    end

    def personal_record(ride)
        if @rides[ride] && !@rides[ride].empty?
            @rides[ride].min
        else
            nil # Return false if no records exist
        end
    end
end