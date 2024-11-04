class Ride
  attr_reader :hash, :name, :distance, :loop, :terrain

  def initialize(hash)
    @name = hash[:name]
    @distance = hash[:distance]
    @loop = hash[:loop]
    @terrain = hash[:terrain]
  end

  def total_distance
    if !@loop
      total_distance = @distance * 2
      total_distance
    else 
      @distance
    end
  end
end