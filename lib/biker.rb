class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain 
  end
  #A Biker will not log a ride if the ride's terrain does not match their acceptable terrain. They also won't log a ride if the ride's total distance is greater than the Biker's max distance.
  def log_ride(ride, time)
    return unless @acceptable_terrain.include?(ride.terrain)
    return unless ride.distance <= @max_distance

    if @rides[ride] == nil #ride been logged?
      @rides[ride] = []
    end

    @rides[ride] << time
  end

  def personal_record(ride)
    if @rides[ride] == nil
      return false
    end

    lowest_time = @rides[ride].min
    return lowest_time
  end
end