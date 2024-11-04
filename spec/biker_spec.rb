require './lib/ride'
require './lib/biker'
require 'rspec'

RSpec.describe Biker do
  describe '#initialize' do 
    it 'exists' do
      biker = Biker.new("Kenny", 30)
      expect(biker).to be_an_instance_of(Biker)
    end

    it 'can have attributes' do
      biker = Biker.new("Kenny", 30)
      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to be_a(Hash)
      expect(biker.acceptable_terrain).to be_a(Array)
    end
  end

  describe '#learn_terrain!' do
    it 'can learn new terrain' do
      biker = Biker.new("Kenny", 30)

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride' do
    it 'can log rides' do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.rides).to include(ride1 => [92.5, 91.1], ride2 => [60.9, 61.6])
    end
  end
  describe '#personal_record' do
    it 'can set a personal record' do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:gravel) #stop forgetting to bring down the proper set up! (plz dont mind me yelling at myself)(wasted a lot of time)
      biker.learn_terrain!(:hills)

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      biker.personal_record(ride1)
      biker.personal_record(ride2)

      expect(biker.personal_record(ride1)).to eq(91.1)
      expect(biker.personal_record(ride2)).to eq(60.9)
    end
  end

  describe '#biker2' do
    it 'can have another biker' do
      biker2 = Biker.new("Athena", 15)
      expect(biker2).to be_an_instance_of(Biker)
    end

    it 'cannot log rides due to unlearned terrain' do
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker2.log_ride(ride1, 97.0) #biker2 doesn't know this terrain yet
      biker2.log_ride(ride2, 67.0) #biker2 doesn't know this terrain yet

      expect(biker2.rides).to eq({})
    end

    context 'must be acceptable terrain and total distance cannot be greater than bikers max distance' do
      it 'can learn terrain if conditions are met' do
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        biker2.learn_terrain!(:gravel)
       
        biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance
        biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance
        expect(biker2.rides).to eq({ride2 => [65.0]})
      end
    end
    it 'can have personal record' do
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      
      biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance

      biker2.personal_record(ride2)
      biker2.personal_record(ride1)

      expect(biker2.personal_record(ride2)).to eq(65.0)
      expect(biker2.personal_record(ride1)).to be(false)
    end
  end
end