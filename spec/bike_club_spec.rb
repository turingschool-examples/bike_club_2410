require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'rspec'

RSpec.describe BikeClub do
  describe '#initialize' do
    it 'has a name' do
      bikeclub = BikeClub.new("Sons of Anarchy")

      expect(bikeclub.name).to eq "Sons of Anarchy"
    end

    it 'has a list of bikers' do
      bikeclub = BikeClub.new("Sons of Anarchy")

      expect(bikeclub.bikers).to eq []
    end
  end

  describe 'behaviors' do
    it 'can add new Bikers' do
      bikeclub = BikeClub.new("Sons of Anarchy")
      biker1 = Biker.new("Kenny", 30)
      bikeclub.add_biker(biker1)
      biker2 = Biker.new("Athena", 15)
      bikeclub.add_biker(biker2)

      expect(bikeclub.bikers).to eq [biker1, biker2]
    end

    it 'can tell which Biker has logged the most rides' do
      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker2 = Biker.new("Athena", 30)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel}) 
      biker1.log_ride(ride1, 92.5)
      biker1.log_ride(ride1, 91.1)
      biker1.log_ride(ride2, 60.9)
      biker1.log_ride(ride2, 61.6)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)

      bikeclub = BikeClub.new("Sons of Anarchy")
      bikeclub.add_biker(biker1)
      bikeclub.add_biker(biker2)

      expect(bikeclub.most_rides).to eq (biker1)
    end

    it 'can tell which Biker has the lowest PR for a ride' do
      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker2 = Biker.new("Athena", 30)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel}) 
      biker1.log_ride(ride1, 92.5)
      biker1.log_ride(ride1, 91.1)
      biker1.log_ride(ride2, 60.9)
      biker1.log_ride(ride2, 61.6)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)

      bikeclub = BikeClub.new("Sons of Anarchy")
      bikeclub.add_biker(biker1)
      bikeclub.add_biker(biker2) 


      expect(bikeclub.best_time(ride1)).to eq biker1

    end

    xit 'can tell which Bikers are eligible for a given ride' do
      
    end
  end
end