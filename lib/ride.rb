# lib/ride.rb
class Ride
    attr_reader :name, :distance, :terrain
  
    def initialize(attributes)
      @name = attributes[:name]
      @distance = attributes[:distance]
      @loop = attributes[:loop]
      @terrain = attributes[:terrain]
    end
  
    def loop?
      @loop
    end
  
    def total_distance
      if loop?
        @distance
      else
        @distance * 2
      end
    end
  end