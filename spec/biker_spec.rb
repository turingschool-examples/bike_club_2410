require './lib/ride'
require './lib/biker'

RSpec.describe Ride do
  before(:each) do
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#initialize" do
    it "Initializes" do
      expect(@biker1).to be_a Biker
      expect(@biker2).to be_a Biker
    end

    it "returns varying biker names" do
      expect(@biker1.name).to eq("Kenny")
      expect(@biker2.name).to eq("Athena")
    end

    it "returns varying biker max_distance" do
      expect(@biker1.max_distance).to eq(30)
      expect(@biker2.max_distance).to eq(15)
    end
        
    it "defaults empty hash for rides" do
      expect(@biker1.rides).to eq({})
      expect(@biker2.rides).to eq({})
    end

    it "defaults empty array for acceptabe_terrain" do
      expect(@biker1.acceptable_terrain).to eq([])
      expect(@biker2.acceptable_terrain).to eq([])
    end

    it "bikers can learn & track acceptable_terrain" do
      @biker1.learn_terrain!(:gravel)
      @biker1.learn_terrain!(:hills)
      
      expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      
      expect(@biker2.acceptable_terrain).to eq([:gravel, :hills])
    end

    xit "returns accurate total distance" do
      expect(@biker1.total_distance).to eq(21.4)
      expect(@biker2.total_distance).to eq(14.9)
    end
  end
end