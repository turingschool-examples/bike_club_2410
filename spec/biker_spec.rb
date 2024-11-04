require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
    before(:each) do
        @biker1 = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe '#initialize' do
      it 'is a biker' do
        expect(@biker1).to be_a(Biker)
      end

      it 'has attributes' do
        expect(@biker1.name).to eq("Kenny")
        expect(@biker1.max_distance).to eq(30)
        expect(@biker1.rides).to eq({})
        expect(@biker1.acceptable_terrain).to eq([])
      end
    end

    describe '#learn_terrain!' do
      it 'can learn multiple new terrains' do
        @biker1.learn_terrain!(:gravel)
        @biker1.learn_terrain!(:hills)
        @biker2.learn_terrain!(:gravel)

        expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])
        expect(@biker2.acceptable_terrain).to eq([:gravel])
      end
    end

    describe '#log_ride' do
      it 'can log a ride if terrain is acceptable and within bikers max distance' do
        @biker1.learn_terrain!(:gravel)
        @biker1.learn_terrain!(:hills)
        @biker1.log_ride(@ride1, 92.5)
        @biker1.log_ride(@ride1, 91.1)
        @biker1.log_ride(@ride2, 60.9)
        @biker1.log_ride(@ride2, 61.6)

        expect(@biker1.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})

        @biker2.learn_terrain!(:gravel)
        @biker2.log_ride(@ride2, 67.0)  

        expect(@biker2.rides).to eq({@ride2 => [67.0]})
      end
    end

    describe '#personal_record' do
      it 'records the lowest time for a ride only if it has been logged' do
        @biker1.learn_terrain!(:gravel)
        @biker1.learn_terrain!(:hills)
        @biker1.log_ride(@ride1, 92.5)
        @biker1.log_ride(@ride1, 91.1)
        @biker1.log_ride(@ride2, 60.9)
        @biker1.log_ride(@ride2, 61.6)

        expect(@biker1.personal_record(@ride1)).to eq(91.1)
        expect(@biker1.personal_record(@ride2)).to eq(60.9)

        @biker2.learn_terrain!(:gravel)
        @biker2.log_ride(@ride2, 67.0)

        expect(@biker2.personal_record(@ride2)).to eq(67.0)
      end

      it 'returns false if the biker has not completed the ride due to max distance limit' do
        @biker2.learn_terrain!(:hills)
        @biker2.log_ride(@ride1, 95.0) 

        expect(@biker2.rides).to eq({})  
        expect(@biker2.personal_record(@ride1)).to eq(false)
      end
    end
end