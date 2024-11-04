require 'spec_helper'

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

  def log_ride(ride, distance) #i cant do it. no matter what i do the tests fail. if i add the last condtion (if they know the terrain but cant do the distance) it breaks the whole thing
    #i understand that the condition right above it is overiding it but no matter what order i put it in it doesnt work. i dont know how to have all three conditions and make it work
    if !@acceptable_terrain.include?(ride.terrain)
      return "#{@name} dosent know this terrain"
    elsif ride.total_distance > @max_distance
      return "#{@name} can't bike this distance"
    elsif @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
      return "#{@name} knows the terrain but cannot bike the distance"
    else 
      if @rides.key?(ride) 
        @rides[ride] << distance
      else
        @rides[ride] = [distance]
      end
    end
  end

  def personal_record(ride)
    if @rides.key?(ride)
      @rides[ride].min
    else
      false
    end
  end
end