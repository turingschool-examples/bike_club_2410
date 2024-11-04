require './lib/biker'
require './lib/ride'

RSpec.describe Biker do
    describe '#instatiate' do
        it 'is an instance of biker' do
            biker = Biker.new("Kenny", 30)

            expect(biker).to be_a(Biker)
        end
    end

    describe '#initialize' do
        it 'has a name, max distance, rides and acceptable terrain attributes' do
            biker = Biker.new("Kenny", 30)

            expect(biker.name).to eq("Kenny")
            expect(biker.max_distance).to eq(30)
            expect(biker.rides).to eq({})
            expect(biker.acceptable_terrain).to eq([])
        end
    end

    describe '#learn_terrain!' do
        it 'allows a biker to learn a new terrain' do
            biker = Biker.new("Kenny", 30)
            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            expect(biker.acceptable_terrain).to eq([:gravel, :hills])
        end
    end

    describe '#log_ride' do
        it 'allows a biker to keep track of their rides and times' do
            biker = Biker.new("Kenny", 30)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)        
            biker.log_ride(ride2, 61.6)

            expected = {
                ride1 => [92.5, 91.1],
                ride2 => [60.9, 61.6]
            }

            expect(biker.rides).to eq(expected)
        end

        it 'confirms biker cannot log a ride if terrain isnt acceptable' do
            biker2 = Biker.new("Athena", 15)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            biker2.log_ride(ride1, 97.0)
            biker2.log_ride(ride2, 67.0)
            expect(biker2.rides).to eq({})
        end

        it 'confirms biker cannot log a ride with a distance greater than their max distance' do
            biker2 = Biker.new("Athena", 15)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            biker2.log_ride(ride1, 97.0)
            biker2.log_ride(ride2, 67.0)
            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)

            biker2.log_ride(ride1, 95.0)
            biker2.log_ride(ride2, 65.0)

            expected = {
                ride2 => [65.0]
            }

            expect(biker2.rides).to eq(expected)
            expect(biker2.personal_record(ride2)).to eq(65.0)
            expect(biker2.personal_record(ride1)).to eq(false)
        end
    end

    describe '#personal_record' do
        it 'returns the best time record for a specified ride' do
            biker = Biker.new("Kenny", 30)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)        
            biker.log_ride(ride2, 61.6)

            expect(biker.personal_record(ride1)).to eq(91.1)
            expect(biker.personal_record(ride2)).to eq(60.9)
        end
    end
end
