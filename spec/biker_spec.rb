require 'spec_helper'

RSpec.describe Biker do
  before (:each) do
    @biker = Biker.new("Kenny", 30)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker2 = Biker.new("Athena", 15)
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@biker).to be_a Biker
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!" do
    it "can add terrain to accetable_terrain array" do
      expect(@biker.learn_terrain!(:gravel)).to eq([:gravel])
      expect(@biker.learn_terrain!(:hills)).to eq([:gravel, :hills])
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe "#log_ride" do
    it "can log ride" do
      expect(@biker.learn_terrain!(:gravel)).to eq([:gravel])
      expect(@biker.learn_terrain!(:hills)).to eq([:gravel, :hills])
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)    

      expect(@biker.rides).to eq({
        @ride1 => [92.5, 91.1], 
        @ride2 => [60.9, 61.6]
      })
    end
  end

  describe "#personal_record" do
    it "can display personal_record" do
      expect(@biker.learn_terrain!(:gravel)).to eq([:gravel])
      expect(@biker.learn_terrain!(:hills)).to eq([:gravel, :hills])
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)    

      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end

  describe "#new log_ride method" do
    it "can return log_ride correctly" do
      @biker2.log_ride(@ride1, 97.0) #biker2 doesn't know this terrain yet
      @biker2.log_ride(@ride2, 67.0) #biker2 doesn't know this terrain yet
      expect(@biker2.rides).to eq({})

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0) # biker2 can't bike this distance
      @biker2.log_ride(@ride2, 65.0) # biker2 knows this terrain and can bike this distance
      expect(@biker2.rides).to eq({
        @ride2 => [65.0]
      })

      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to eq(false)
    end
  end
end