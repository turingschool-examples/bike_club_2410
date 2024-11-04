class Ride
  attr_reader :name, :distance, :loop, :terrain, :total_distance

  def initialize(info_hash)
    @name = info_hash[:name]
    @distance = info_hash[:distance]
    @loop = info_hash[:loop]
    @terrain = info_hash[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    if @loop == false
      @distance * 2
    else
      @distance
    end
  end

end