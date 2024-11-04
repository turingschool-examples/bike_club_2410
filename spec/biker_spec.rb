require './spec/spec_helper'

RSpec.describe Biker do

  # Iteration 2

  describe "#initialize" do
    before(:each) do
      @biker = Biker.new("Kenny", 30)
    end

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
end