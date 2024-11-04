require './spec/spec_helper'

RSpec.describe Biker do

  # Iteration 2
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)

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
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      expect(@biker.log_ride(@ride1, 92.5)).to be true
      expect(@biker.log_ride(@ride2, 60.9)).to be true
    end

    it 'can log multiple times for different rides' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      expect(@biker.log_ride(@ride1, 92.5)).to be true
      expect(@biker.log_ride(@ride1, 91.1)).to be true

      expect(@biker.log_ride(@ride2, 60.9)).to be true
      expect(@biker.log_ride(@ride2, 61.6)).to be true
    end

    it 'can log the rides in the rides log' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

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

  describe "#restrictions" do
    it 'can not go on ride if acceptable_terrain does not contain terrian type' do
      expect(@biker2.acceptable_terrain).to be_empty
      expect(@biker2.rides).to be_empty

      expect(@biker2.log_ride(@ride1, 97.0)).to be false
      expect(@biker2.log_ride(@ride2, 67.0)).to be false

      expect(@biker2.rides).to be_empty
    end

    it 'can not go on ride if the total_distance of ride is greater than max_distance' do
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      expect(@biker2.log_ride(@ride1, 95.0)).to be false

      expect(@biker2.rides).to be_empty
    end

    it 'can only go on a ride if they know the terrain and can bike total distance' do
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      expect(@biker2.log_ride(@ride2, 65.0)).to be true

      expect(@biker2.rides).to eq({@ride2 => [65.0]})
    end

    it 'only returns personal_records of eligible rides, otherwise false' do
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)

      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to be false
    end
  end

end