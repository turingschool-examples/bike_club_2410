class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrains

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrains = []
  end

  def learn_terrain!(terrain_type)
    @acceptable_terrains << terrain_type
  end

  def log_ride(ride, time)
    if @acceptable_terrains.include?(ride.terrain) && @max_distance >= ride.total_distance
      if @rides.key?(ride)
        @rides[ride] << time
      else
        @rides[ride] = [time]
      end
    end
  end

  def personal_record(ride)
    if @rides.key?(ride)
      rides[ride].min
    else
      false
    end
  end
end
