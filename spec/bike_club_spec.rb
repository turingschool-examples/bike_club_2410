require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'rspec'

RSpec.describe BikeClub do
  describe '#initialize' do
    it 'exists' do
      bike_club = BikeClub.new("Turing")
      expect(bike_club).to be_an_instance_of(BikeClub)
    end

    it 'has attributes' do
      bike_club = BikeClub.new("Turing")
      expect(bike_club.name).to eq("Turing")
      expect(bike_club.bikers).to be_an(Array)
    end
  end

  describe '#add_biker(biker)' do
    it 'can add a biker to the bikers array' do
      bike_club = BikeClub.new("Turing")
      biker = Biker.new("Kenny", 30)

      bike_club.add_biker(biker)

      expect(bike_club.bikers).to eq([biker])
    end
  end

  describe '#most_rides' do
    it 'can tell us which biker has logged the  most rides' do
      bike_club = BikeClub.new("Turing")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)

      bike_club.add_biker(biker)
      bike_club.add_biker(biker2)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)

      biker2.log_ride(ride2, 65.0)
      expect(bike_club.most_rides).to eq(biker)
    end
  end
end