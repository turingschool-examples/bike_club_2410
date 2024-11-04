# spec/biker_spec.rb

require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    # Create ride instances to test with
    @ride1 = Ride.new({ name: "Black Creek Trail", distance: 10.7, loop: false, terrain: :hills })
    @ride2 = Ride.new({ name: " Cape Town Lake", distance: 14.9, loop: true, terrain: :gravel })

    # Create a Biker instance for testing
    @biker = Biker.new("Syre", 30)
  end

  it 'exists' do
    # Check if the Biker instance is created successfully
    expect(@biker).to be_a(Biker)
  end

  it 'has attributes' do
    # Verify Biker's name and max_distance attributes
    expect(@biker.name).to eq("Syre")
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

    it 'does not log rides outside acceptable terrain or distance' do
    # Only add :gravel to acceptable terrain (not :hills)
    @biker.learn_terrain!(:gravel)

    # Attempt to log a ride with :hills terrain and another over max distance
    @biker.log_ride(@ride1, 95.0) # Should not log, as @ride1 is :hills
    @biker.log_ride(@ride2, 65.0) # Should log, as @ride2 is within distance and acceptable terrain

    expect(@biker.rides).to eq({
      @ride2 => [65.0]
    })
    end

    it 'returns personal record for a ride' do
    # Add terrains, log rides, and verify personal record
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)

    # Personal record for @ride1 should be the lowest time (91.1)
    expect(@biker.personal_record(@ride1)).to eq(91.1)

    # If no rides logged for a ride, personal_record should return false
    expect(@biker.personal_record(@ride2)).to eq(false)
  end
end