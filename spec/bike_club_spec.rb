# spec/bike_club_spec.rb

require './lib/ride'
require './lib/biker'
require './lib/bike_club'

# Class Setup and Initial Attributes
RSpec.describe BikeClub do
  before(:each) do
    # Create rides to use in tests
    @ride1 = Ride.new({ name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills })
    @ride2 = Ride.new({ name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel })

    # Create bikers with max distances
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)

    # Set up the bikers with acceptable terrain and log rides
    @biker1.learn_terrain!(:hills)
    @biker1.learn_terrain!(:gravel)
    @biker1.log_ride(@ride1, 92.5)
    @biker1.log_ride(@ride1, 91.1)
    @biker1.log_ride(@ride2, 60.9)

    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
    @biker2.log_ride(@ride2, 65.0)

    # Create a BikeClub instance
    @bike_club = BikeClub.new("Mountain Riders")
  end

# Test Existence of BikeClub
  it 'exists' do
    # Check if BikeClub instance is created successfully
    expect(@bike_club).to be_a(BikeClub)
  end
  
# Test bikers_eligible Method
  it 'has attributes' do
    # Validate the name and bikers attributes
    expect(@bike_club.name).to eq("Mountain Riders")
    expect(@bike_club.bikers).to eq([])
  end

#  Test add_biker Method
  it 'can add bikers' do
    # Add bikers and check the bikers array
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    
    expect(@bike_club.bikers).to eq([@biker1, @biker2])
  end

# Test most_rides Method
  it 'can find the biker with the most rides' do
    # Add bikers and verify the one with the most rides
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    
    expect(@bike_club.most_rides).to eq(@biker1)
  end

# Test best_time Method
  it 'can find the biker with the best time for a specific ride' do
    # Add bikers and check who has the best time for a specific ride
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    
    expect(@bike_club.best_time(@ride2)).to eq(@biker1)
  end

#  Test bikers_eligible Method
  it 'can find bikers eligible for a ride' do
    # Add bikers and check who is eligible for a specific ride
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    
    expect(@bike_club.bikers_eligible(@ride1)).to eq([@biker1])
    expect(@bike_club.bikers_eligible(@ride2)).to eq([@biker1, @biker2])
  end
end