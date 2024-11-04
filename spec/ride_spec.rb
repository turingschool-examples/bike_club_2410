require './lib/ride'

RSpec.describe Ride do
    describe '#instatiate' do
        it 'is an instance of ride' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

            expect(ride1).to be_a(Ride)
        end
    end

    describe '#initialize' do
        it 'has a name, distance, loop, terrain attribute' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            
            expect(ride1.name).to eq("Walnut Creek Trail")
            expect(ride1.distance).to eq(10.7)
            expect(ride1.terrain).to eq(:hills)
            expect(ride1.loop?).to eq(false)
        end
    end

    describe '#distance' do
        it 'returns the total distance of the ride' do
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            expect(ride1.total_distance).to eq(21.4)
            expect(ride2.loop?).to eq(true)
            expect(ride2.total_distance).to eq(14.9)
        end
    end
end