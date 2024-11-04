require './spec/spec_helper'

RSpec.describe BikeClub do

  # Iteration 3
  before(:each) do
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @biker3 = Biker.new("Maria", 18)

    @ride1 = Ride.new({name: "Walnut Creek Trail", 
                      distance: 10.7, 
                      loop: false, 
                      terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", 
                      distance: 14.9, 
                      loop: true, 
                      terrain: :gravel})

    @bike_club = BikeClub.new("Foothills Bike Club")
  end

  describe "#initialize" do
    it 'exists' do
      expect(@bike_club).to be_a(BikeClub)
    end

    it 'has a name' do 
      expect(@bike_club.name).to eq("Foothills Bike Club")
    end

    it 'has a list of bikers defaulted to an empty array' do
      expect(@bike_club.bikers).to eq([])
    end
  end

  describe "#add_biker" do
    it 'can add a biker to list of bikers' do
      expect(@bike_club.bikers).to eq([])

      @bike_club.add(@biker1)
      @bike_club.add(@biker2)

      expect(@bike_club.bikers).to eq([@biker1, @biker2])
    end
  end
end