require 'spec_helper'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe 'intiailize' do
    it "exists and has attributes" do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "learn_terrain!" do
    it "adds a terrain to the acceptable terrain array" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])

    end
  end

  describe "log_ride" do
    it "logs rides into the rides hash" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker2.log_ride(@ride1, 97.0)).to eq("Athena dosent know this terrain")
      expect(@biker2.rides).to eq({})
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      expect(@biker2.log_ride(@ride1, 95.0)).to eq("Athena can't bike this distance")
      expect(@biker2.log_ride(@ride2, 65.0)).to eq("Athena knows the terrain but cannot bike the distance")
      expect(@biker.rides).to include(@ride1)
      expect(@biker.rides[@ride1]).to eq([92.5, 91.1])
    end
  end

  describe "personal_record" do
    it "displays the bikers personal record dpedning on the specific ride" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end

  describe

end