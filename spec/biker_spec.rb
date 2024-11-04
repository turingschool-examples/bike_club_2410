require './lib/ride'
require './lib/biker'

RSpec.describe do 
    before(:each) do
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
    end

    describe '#initialize' do
        it 'is a biker' do
            expect(@biker).to be_a(Biker)
            expect(@biker2).to be_a(Biker)
        end

        it 'has a name' do
            expect(@biker.name).to eq("Kenny")
            expect(@biker2.name).to eq("Athena")
        end

        it 'has a max_distance' do
            expect(@biker.max_distance).to eq(30)
            expect(@biker2.max_distance).to eq(15)
        end

        it 'has an empty hash of rides' do
            expect(@biker.rides).to eq({})
            expect(@biker2.rides).to eq({})
        end

        it 'has an empty array of acceptable_terrain' do
            expect(@biker.acceptable_terrain).to eq([])
            expect(@biker2.acceptable_terrain).to eq([])
        end
    end

    describe '#learn_terrain!(terrain)' do
        it 'adds terrain to the bikers acceptable_terrain array' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
            expect(@biker2.acceptable_terrain).to eq([:gravel, :hills])
        end
    end

    before(:each) do
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe '#log_ride(ride, time)' do
        it 'adds rides to the bikers rides hash if they have learned the terrain' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)

            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 91.1)
            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 61.6)

            expected = {
                @ride1 => [92.5, 91.1],
                @ride2 => [60.9, 61.6]
            }

            expect(@biker.rides).to eq(expected)

            @biker2.log_ride(@ride1, 97.0)
            @biker2.log_ride(@ride1, 67.0)

            expect(@biker2.rides).to eq({})

            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            @biker2.log_ride(@ride1, 95.0)
            @biker2.log_ride(@ride2, 65.0)

            expect(@biker2.rides).to eq({@ride2 => [65.0]})
        end
    end

    describe '#personal_record(ride)' do
        xit 'tracks a riders best distance on a ride' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 91.1)
            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 61.6)
            @biker2.log_ride(@ride1, 95.0)
            @biker2.log_ride(@ride2, 65.0)



            expect(@biker.personal_record(@ride1)).to eq(91.1)
            expect(@biker.personal_record(@ride2)).to eq(60.9)
            expect(@biker2.personal_record(@ride1)).to eq(false)
            expect(@biker2.personal_record(@ride2)).to eq(65.0)
        end
    end
end