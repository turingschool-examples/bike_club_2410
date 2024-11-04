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
    return true
  end

  def log_ride(ride, time)
    return false unless @acceptable_terrain.include?(ride.terrain) == true
    return false unless @max_distance > ride.total_distance

    if @rides.keys.include?(ride) != true
      @rides[ride] = [time]
    else
      @rides[ride] << time
    end
    return true
  end

  def personal_record(ride)
    return false if @rides.keys.include?(ride) != true
   
    times = @rides[ride] 
    best_time = times.min_by do |time|
      time
    end
    best_time
  end
end