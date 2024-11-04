require_relative 'spec_helper'

RSpec.describe Biker do
  describe '#initialize' do
    it 'exists' do
      biker = Biker.new("Kenny", 30)
      expect(biker).to be_an_instance_of(Biker)
    end

    it 'has attributes' do
      biker = Biker.new("Kenny", 30)

      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end

    it 'can have some different attributes' do
      biker2 = Biker.new("Athena", 15)

      expect(biker2.name).to eq("Athena")
      expect(biker2.max_distance).to eq(15)
      expect(biker2.rides).to eq({})
      expect(biker2.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain!' do
    it 'adds a new terrain to the bikers acceptable terrains' do
      biker = Biker.new("Kenny", 30)

      expect(biker.acceptable_terrain).to eq([])
      biker.learn_terrain!(:gravel)
      expect(biker.acceptable_terrain).to eq([:gravel])
      biker.learn_terrain!(:hills)
      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride' do
    context 'each unique ride is a key, with all the times for each ride being the values' do
      it 'saves a bikers ride and time in the rides attribute' do
        biker = Biker.new("Kenny", 30)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)

        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)

        expect(biker.rides.keys).to contain_exactly(ride1, ride2)
        expect(biker.rides[ride1]).to contain_exactly(92.5, 91.1)
        expect(biker.rides[ride2]).to contain_exactly(60.9, 61.6)
      end
      
      it 'will not log if rides terrain is not accepted by biker' do
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        biker2.log_ride(ride1, 97.0)
        biker2.log_ride(ride2, 67.0)

        expect(biker2.rides).to eq({})
      end

      it 'will not log if rides total distance is higher than bikers max_distance' do
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        
        biker2.learn_terrain!(:gravel)
        biker2.learn_terrain!(:hills)

        biker2.log_ride(ride1, 95.0)
        biker2.log_ride(ride2, 65.0)

        expect(biker2.rides).to eq({ride2 => [65.0]})
      end
    end
  end

  describe '#personal_record' do
    context 'returns false if biker has no saved time for a ride' do
      it 'returns a bikers best ride time for a specific ride' do
        biker = Biker.new("Kenny", 30)
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)
        biker2.learn_terrain!(:gravel)
        biker2.learn_terrain!(:hills)
        
        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
        biker2.log_ride(ride2, 65.0)

        expect(biker.personal_record(ride1)).to eq(91.1)
        expect(biker.personal_record(ride2)).to eq(60.9)
        expect(biker2.personal_record(ride1)).to be false
        expect(biker2.personal_record(ride2)).to eq(65.0)
      end
    end
  end
end