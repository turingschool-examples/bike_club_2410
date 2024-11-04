# spec/bike_club_spec.rb

require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before(:each) do
    # Create rides to use in tests
    @ride1 = Ride.new({ name: "Black Creek Trail", distance: 10.7, loop: false, terrain: :hills })
    @ride2 = Ride.new({ name: "Cape Town Lake", distance: 14.9, loop: true, terrain: :gravel })

    # Create bikers with max distances
    @biker1 = Biker.new("Syre", 30)
    @biker2 = Biker.new("Scarlett", 15)

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

  it 'exists' do
  expect(@bike_club).to be_a(BikeClub)
end
it 'has attributes' do
  expect(@bike_club.name).to eq("Mountain Riders")
  expect(@bike_club.bikers).to eq([])
end

it 'can add bikers' do
  @bike_club.add_biker(@biker1)
  @bike_club.add_biker(@biker2)
  
  expect(@bike_club.bikers).to eq([@biker1, @biker2])
end

it 'can find the biker with the most rides' do
  @bike_club.add_biker(@biker1)
  @bike_club.add_biker(@biker2)
  
  expect(@bike_club.most_rides).to eq(@biker1)
end

it 'can find the biker with the best time for a specific ride' do
  @bike_club.add_biker(@biker1)
  @bike_club.add_biker(@biker2)
  
  expect(@bike_club.best_time(@ride2)).to eq(@biker1)
end