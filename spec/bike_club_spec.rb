require 'spec_helper'

RSpec.describe BikeClub do
  before (:each) do
    @bikeClub = BikeClub.new('Bikee')
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@bikeClub).to be_a BikeClub
      expect(@bikeClub.bikers).to eq([])
    end
  end

  describe "#add_biker" do
    it "can add biker to the bikers array" do
      @bikeClub.add_biker('Patrick')
      expect(@bikeClub.bikers).to eq(['Patrick'])
    end
  end

  describe "#most_rides" do
    it "can return biker with most rides" do
      @bikeClub.add_biker(@biker)
      @bikeClub.add_biker(@biker2)

      #biker1
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      #biker2
      @biker2.learn_terrain!(:gravel)
      @biker2.log_ride(@ride2, 65.0)

      expect(@bikeClub.most_rides).to eq([@biker])
    end
  end
end