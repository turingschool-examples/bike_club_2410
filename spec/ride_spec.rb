require './lib/ride'
require 'rspec'

RSpec.describe Ride do
  describe '#initilaize' do
    it 'exists' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride1).to be_an_instance_of(Ride)
    end

    it 'has attributes' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride1.name).to eq("Walnut Creek Trail")
      expect(ride1.distance).to eq(10.7)
      expect(ride1.loop).to be(false)
      expect(ride1.terrain).to eq(:hills)
    end
  end

  describe '#total_distance' do
    it 'can report total distance if the ride is not a loop' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride1.loop).to be(false)

      ride1.total_distance
      expect(ride1.total_distance).to eq(21.4)
    end
  end

  describe 'ride 2' do
    it 'can have another ride' do
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      expect(ride2.loop).to be(true)
      expect(ride2.total_distance).to eq(14.9)
    end
  end
end