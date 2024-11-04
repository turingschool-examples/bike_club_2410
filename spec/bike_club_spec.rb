require './spec/spec_helper'

RSpec.describe BikeClub do

  # Iteration 3
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", 
                      distance: 10.7, 
                      loop: false, 
                      terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", 
                      distance: 14.9, 
                      loop: true, 
                      terrain: :gravel})
    @ride3 = Ride.new({name: "Lake Estes",
                      distance: 19.3,
                      loop: true,
                      terrain: :hills})

    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @biker3 = Biker.new("Maria", 18)

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

  describe "biker_trackers" do
    before(:each) do
      @biker1.learn_terrain!(:gravel)
      @biker1.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker3.learn_terrain!(:gravel)
      @biker3.learn_terrain!(:hills)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)
      @biker1.log_ride(@ride2, 60.9)
      @biker1.log_ride(@ride3, 97.6)
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 60.3)
      @biker2.log_ride(@ride3, 100.2)
      @biker3.log_ride(@ride2, 63.4)
      @biker3.log_ride(@ride3, 94.3)
      @biker3.log_ride(@ride3, 96.8)
    end

    describe "#most_rides" do
      it 'can determine which biker has logged the most rides' do
        expect(@bike_club.most_rides).to eq(@biker1)
      end  
    end

    descirbe "#best_time" do
      it 'can determine which biker has the best time for a ride' do
        expect(@bike_club.best_time(@ride1)).to eq(@biker1) 
        expect(@bike_club.best_time(@ride2)).to eq(@biker2)
        expect(@bike_club.best_time(@ride3)).to eq(@biker3)
      end
    end

    describe "#biker_eligible" do
      it 'can determine is a biker is eligible for a ride' do
        expect(@bike_club.bikers_eligible(@ride1)).to eq([@biker1, @biker2, @biker3])
        expect(@bike_club.bikers_eligible(@ride2)).to eq([@biker1, @biker3])
        expect(@bike_club.bikers_eligible(@ride2)).to eq([@biker1])
      end
    end
  end
end