require './spec/spec_helper'

RSpec.describe Biker do

  # Iteration 2
  before(:each) do
    @biker = Biker.new("Kenny", 30)
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
end