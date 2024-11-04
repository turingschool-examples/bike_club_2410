require './spec/spec_helper'

class Biker
  attr_reader :name, :max_distance, :acceptable_terrain, :rides

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @acceptable_terrain = []
    @rides = Hash.new { |hash, key| hash[key] = [] }
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @max_distance >= ride.total_distance && @acceptable_terrain.include?(ride.terrain)
      @rides[ride] << time
    end
  end

  def personal_record(ride)
    best_time = false

    if @rides[ride].empty?
      return best_time
    else
      @rides[ride].each do |time|
        if best_time == false
          best_time = time
        else
          best_time = time if time < best_time
        end
      end
    end

    best_time
  end
end