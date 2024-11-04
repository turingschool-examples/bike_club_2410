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

    def accepted_terrain?(terrain)
        if acceptable_terrain.include?(terrain)
            true
        else
            false
        end
    end

    def accepted_distance?(distance)
        if max_distance >= distance
            true
        else
            false
        end
    end

    def learn_terrain!(terrain)
        acceptable_terrain << terrain
    end

    def log_ride(ride, time)
        if accepted_terrain?(ride.terrain) && accepted_distance?(ride.total_distance)
            if rides[ride]
                rides[ride] << time
            else
                rides[ride] = [time]
            end
            return "#{self.name} knows this terrain and can bike this distance"
        elsif accepted_terrain?(ride.terrain) && !accepted_distance?(ride.total_distance)
           return "#{self.name} can't bike this distance"
        elsif accepted_distance?(ride.total_distance) && !accepted_terrain?(ride.terrain)  
           return "#{self.name} doesn't know this terrain yet"
        else
            return "#{self.name} can't bike this distance and doesn't know this terrain yet"
        end
        rides
    end

    def personal_record(ride)
        if rides[ride] 
            ordered_times = rides[ride].sort
            ordered_times.first
        else 
            false
        end
    end


end