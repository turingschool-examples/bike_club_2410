require './lib/ride'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe '#initialize' do
      it 'is a ride' do
        expect(@ride1).to be_a(Ride)
      end
    end

    it 'has attributes' do
        expect(@ride1.name).to eq("Walnut Creek Trail")
        expect(@ride1.distance).to eq(10.7)
        expect(@ride1.terrain).to eq(:hills)
    end

    it 'can check if any ride is a loop' do
        expect(@ride1.loop?).to be(false)
        expect(@ride2.loop?).to be(true)
    end

    it 'can report the total distance traveled' do
        expect(@ride1.total_distance).to eq(21.4)
        expect(@ride2.total_distance).to eq(14.9)
    end
end

