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
end