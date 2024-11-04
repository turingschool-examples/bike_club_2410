require 'pry'
require 'rspec'
require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
    describe '#initialize' do
        it 'exists' do
            biker = Biker.new("Kenny", 30)

            expect(biker).to be_an_instance_of(Biker)
        end

        it 'has attributes' do
            biker = Biker.new("Kenny", 30)
            binding.pry

            expect(biker.name).to eq("Kenny")
            expect(biker.max_distance).to eq(30)
            expect(biker.rides).to eq({})
            expect(biker.acceptable_terrain).to eq([])
        end
    end

    describe '#terrain' do
        it 'can learn terrain' do
            biker = Biker.new("Kenny", 30)

            biker.learn_terrain!(:gravel)
            expect(biker.acceptable_terrain).to eq([:gravel])

            biker.learn_terrain!(:hills)
            expect(biker.acceptable_terrain).to eq([:gravel, :hills])
        end
    end

    describe '#rides' do
        it 'can log rides' do
            biker = Biker.new("Kenny", 30)
            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            expect(ride1).to be_an_instance_of(Ride)

            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            expect(ride2).to be_an_instance_of(Ride)

            biker.log_ride(ride1, 92.5)
            expect(biker.rides).to eq({ride1 => [92.5]})
            biker.log_ride(ride1, 91.1)
            expect(biker.rides).to eq({ride1 => [92.5, 91.1]})
            biker.log_ride(ride2, 60.9)
            expect(biker.rides).to eq({ride1 => [92.5, 91.1], ride2 => [60.9]})
            biker.log_ride(ride2, 61.6)
            expect(biker.rides).to eq({ride1 => [92.5, 91.1], ride2 => [60.9, 61.6]})
        end
    end

    describe '#records' do
        it 'can detect personal records' do
            biker = Biker.new("Kenny", 30)
            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)

            expect(biker.personal_record(ride1)).to eq(91.1)
            expect(biker.personal_record(ride2)).to eq(60.9)

            biker2 = Biker.new("Athena", 15)
            expect(biker2).to be_an_instance_of(Biker)

            biker2.log_ride(ride1, 97.0) 
            biker2.log_ride(ride2, 67.0)
            expect(biker2.log_ride(ride1, 97.0)).to eq( "Athena can't bike this distance and doesn't know this terrain yet")
            expect(biker2.log_ride(ride2, 67.0)).to eq( "Athena doesn't know this terrain yet")

            expect(biker2.rides).to eq({})
            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)

            expect(biker2.log_ride(ride1, 95.0)).to eq("Athena can't bike this distance")
            expect(biker2.log_ride(ride2, 65.0)).to eq("Athena knows this terrain and can bike this distance")

            expect(biker2.personal_record(ride2)).to eq(65.0)
            expect(biker2.personal_record(ride1)).to eq(false)

        end
    end


end
