require './lib/ride'
require './lib/biker'
require 'rspec'

RSpec.describe Biker do
  describe '#initialize' do
    it 'assigns a name' do
      biker = Biker.new("Kenny", 30)
      
      expect(biker.name).to eq "Kenny"
    end

    it 'assigns a max_distance' do
      biker = Biker.new("Kenny", 30)

      expect(biker.max_distance).to eq 30
    end

    it 'holds an empty hash of logged rides' do
      biker = Biker.new("Kenny", 30)

      expect(biker.rides).to eq ({})
    end

    it 'holds an empty array of acceptable terrains' do
      biker = Biker.new("Kenny", 30)

      expect(biker.acceptable_terrains).to eq []
    end
  end

  describe 'behaviors' do
    it 'can add different elements to the #acceptable_terrains array' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrains).to eq [:gravel, :hills]
    end

    it 'can add a ride/time key-value pair to the #rides hash' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel}) 
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expected_rides = {
        ride1 => [92.5, 91.1],
        ride2 => [60.9, 61.6]
      }

      expect(biker.rides).to eq(expected_rides)
    end

    it 'can return the lowest stored time for a given ride' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel}) 
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.personal_record(ride1)).to eq 91.1
      expect(biker.personal_record(ride2)).to eq 60.9
    end

    it 'will not add a ride to the #rides hash if the terrain has not been learned' do
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker2.log_ride(ride1, 97.0)
      biker2.log_ride(ride2, 67.0)

      expect(biker2.rides).to eq ({})
    end

    it 'will not add a ride to the #rides hash if the ride distance is greater than the rider max_distance' do
      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)
      
      expect(biker2.rides).to eq({ ride2 => [65.0] })
    end

    it 'can return the lowest ride time or false' do
    biker2 = Biker.new("Athena", 15)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)

    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker2.log_ride(ride1, 95.0)
    biker2.log_ride(ride2, 65.0)
    biker2.rides

    expect(biker2.personal_record(ride2)).to eq 65.0
    expect(biker2.personal_record(ride1)).to eq false
    end

    it 'can calculate the total number of rides taken' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel}) 
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.ride_count).to eq 4
    end
  end
end