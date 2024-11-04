require_relative 'spec_helper'

RSpec.describe Ride do
  describe '#initialize' do
    it 'exists' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride1).to be_an_instance_of(Ride)
    end

    it 'has attributes' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      expect(ride1.name).to eq("Walnut Creek Trail")
      expect(ride1.distance).to eq(10.7)
      expect(ride1.terrain).to eq(:hills)
    end

    it 'can have different attributes' do
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      expect(ride2.name).to eq("Town Lake")
      expect(ride2.distance).to eq(14.9)
      expect(ride2.terrain).to eq(:gravel)
    end
  end

  describe '#loop?' do
    it 'returns the value of the Rides loop attribute' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      expect(ride1.loop?).to be false
      expect(ride2.loop?).to be true
    end
  end

  describe '#total_distance' do
    it 'returns the base distance attribute if loop is true' do
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      expect(ride2.distance).to eq(14.9)
      expect(ride2.loop?).to be true
      expect(ride2.total_distance).to eq(14.9)
    end

    it 'returns distance times two if loop is false' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      expect(ride1.distance).to eq(10.7)
      expect(ride1.loop?).to be false
      expect(ride1.total_distance).to eq(21.4)
    end
  end
end