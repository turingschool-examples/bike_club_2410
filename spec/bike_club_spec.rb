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