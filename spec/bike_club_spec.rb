require 'pry'
require 'rspec'
require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    describe '#initialize' do
        it 'exists' do
            bikeclub_1 = BikeClub.new("Cruz")

            expect(bikeclub_1).to be_an_instance_of(BikeClub)
        end

        it 'has attributes' do
            bikeclub_1 = BikeClub.new("Cruz")

            expect(bikeclub_1.name).to eq("Cruz")
            expect(bikeclub_1.bikers).to eq([])
        end
    end

    describe '#bikers' do
        it 'can add bikers' do
            bikeclub_1 = BikeClub.new("Cruz")

            biker = Biker.new("Kenny", 30)

            bikeclub_1.add_bikers(biker)

            expect(bikeclub_1.bikers).to eq([biker])
        end
    end

    describe '#compare bikers' do
        it 'can find bikers with most rides' do
            bikeclub_1 = BikeClub.new("Cruz")
            biker = Biker.new("Kenny", 30)
            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)

            biker2 = Biker.new("Athena", 15)
            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)
            biker2.log_ride(ride1, 97.0) 
            biker2.log_ride(ride2, 67.0)

            bikeclub_1.add_bikers(biker)
            bikeclub_1.add_bikers(biker2)

            binding.pry

            expect(bikeclub_1.biker_most_rides).to eq(biker)           
        end
    end
end