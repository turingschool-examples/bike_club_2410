# spec/ride_spec.rb

# The Ride class is responsible for holding information about individual rides. 
# This test file validates that the Ride class can initialize with correct attributes 
# and provides methods to check if the ride is a loop and calculate total distance.
# Do this so I can move to Iteration 3 without having to double check my code after each Iteration.

require './lib/ride' # Load the Ride class to test it

# Describe block for the Ride class to group all tests related to Ride.
RSpec.describe Ride do
  # Using before(:each) to set up Ride instances that can be used in multiple tests.
  before(:each) do
    # Creating two Ride instances for testing
    @ride1 = Ride.new({ name: "Black Creek Trail", distance: 10.7, loop: false, terrain: :hills })
    @ride2 = Ride.new({ name: "Cape Town Lake", distance: 14.9, loop: true, terrain: :gravel })
  end

  # Test to check if the Ride instance is created successfully
  it 'exists' do
    # Using expect to verify that @ride1 is an instance of Ride
    expect(@ride1).to be_a(Ride)
  end

  # Test to check if the Ride instance has correct attributes after initialization
  it 'has attributes' do
    # Validating each attribute of @ride1
    expect(@ride1.name).to eq("Black Creek Trail") # Checking the name
    expect(@ride1.distance).to eq(10.7)             # Checking the base distance
    expect(@ride1.terrain).to eq(:hills)            # Checking the terrain type
    expect(@ride1.loop?).to eq(false)               # Checking if it’s a loop
  end

  # Test to verify that the total_distance method calculates correctly based on loop status
  it 'can calculate total distance' do
    # For @ride1 (not a loop), the total distance should double (10.7 * 2)
    expect(@ride1.total_distance).to eq(21.4)
    # For @ride2 (a loop), the total distance should be the base distance (14.9)
    expect(@ride2.total_distance).to eq(14.9)
  end
end