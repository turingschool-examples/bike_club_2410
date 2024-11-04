require './spec/spec_helper'

RSpec.describe Ride do
  # Iteration 1

  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#initialize" do
    it 'exists' do
      expect(@ride1).to be_a(Ride)
    end

    it 'has a name' do
      expect(@ride1.name).to eq("Walnut Creek Trail")
    end

    it 'has a distance' do 
      expect(@ride1.distance).to eq(10.7)
    end

    it 'has a terrain' do 
      expect(@ride1.terrain).to eq(:hills)
    end
  end

  describe "#loop?" do
    it 'can determine if ride is a loop' do
      expect(@ride1.loop?).to be false
      expect(@ride2.loop?).to be true
    end
  end

  describe "#total_distance" do
    it 'has double the distance if the ride is not a loop' do
      expect(@ride1.total_distance).to eq(21.4)
      expect(@ride2.total_distance).to eq(14.9)
    end
  end
end