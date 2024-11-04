require './lib/ride'
require 'rspec'

RSpec.describe Ride do
  describe "#initialize" do
    it 'assigns a name' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      
      expect(ride1.name).to eq "Walnut Creek Trail"
    end

    it 'assigns a distance' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      
      expect(ride1.distance).to eq 10.7
    end

    it 'describes terrain' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      
      expect(ride1.terrain).to eq :hills
    end

    it 'describes loop status as true/false' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      
      expect(ride1.loop).to eq false
    end
  end

  describe "behaviors" do
    it 'indicates if a ride is a loop' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      expect(ride1.loop?).to eq false

      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      expect(ride2.loop?).to eq true
    end

    it 'calculates total ride distance' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      expect(ride1.total_distance).to eq 21.4

      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      
      expect(ride2.total_distance).to eq 14.9
    end
  end
end