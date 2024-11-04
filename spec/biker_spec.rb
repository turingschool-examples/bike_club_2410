require './spec/spec_helper'

RSpec.describe Biker do

  # Iteration 2
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @ride1 = Ride.new({name: "Walnut Creek Trail", 
                      distance: 10.7, 
                      loop: false, 
                      terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", 
                      distance: 14.9, 
                      loop: true, 
                      terrain: :gravel})
  end

  describe "#initialize" do
    it 'exists' do
      expect(@biker).to be_a(Biker)
    end

    it 'has a name' do
      expect(@biker.name).to eq("Kenny")
    end

    it 'has a max_distance' do
      expect(@biker.max_distance).to eq(30)
    end

    it 'has a log of rides deafaulted to an empty hash' do
      expect(@biker.rides).to eq({})
    end

    it 'has a list of acceptable terrains defaulted to an empty array' do
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!" do
    it 'can learn a new terrain' do
      expect(@biker.learn_terrain!(:gravel)).to be true
      expect(@biker.learn_terrain!(:hills)).to be true
    end

    it 'can record newly learned terrains in acceptable terrains list' do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe "#log_ride" do
    it 'can log a rides' do
      expect(@biker.log_ride(@ride1, 92.5)).to be true
      expect(@biker.log_ride(@ride2, 60.9)).to be true
    end

    it 'can log multiple times for different rides' do
      expect(@biker.log_ride(@ride1, 92.5)).to be true
      expect(@biker.log_ride(@ride1, 91.1)).to be true

      expect(@biker.log_ride(@ride2, 60.9)).to be true
      expect(@biker.log_ride(@ride2, 61.6)).to be true
    end

    it 'can log the rides in the rides log' do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@biker.rides).to eq({@ride1 => [92.5, 91.1],
                                  @ride2 => [60.9, 61.6]})
    end
  end

  describe "#personal_record" do
    it 'returns biker\'s personal record based on ride' do
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end
end