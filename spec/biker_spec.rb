# spec/biker_spec.rb

require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    # Create ride instances to test with
    @ride1 = Ride.new({ name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills })
    @ride2 = Ride.new({ name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel })

    # Create a Biker instance for testing
    @biker = Biker.new("Kenny", 30)
  end

  it 'exists' do
    # Check if the Biker instance is created successfully
    expect(@biker).to be_a(Biker)
  end

  it 'has attributes' do
    # Verify Biker's name and max_distance attributes
    expect(@biker.name).to eq("Kenny")
    expect(@biker.max_distance).to eq(30)

    # Check that rides and acceptable_terrain are initially empty
    expect(@biker.rides).to eq({})
    expect(@biker.acceptable_terrain).to eq([])
  end

    it 'can learn new terrain' do
    # Add new terrains and verify they are stored in acceptable_terrain
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)

    expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
  end

    it 'logs rides within acceptable terrain and distance' do
    # Add terrains to acceptable_terrain
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)

    # Log rides and check if they meet requirements
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)

    # Verify the rides hash now contains times for each logged ride
    expect(@biker.rides).to eq({
      @ride1 => [92.5, 91.1],
      @ride2 => [60.9]
    })
    end
end