# spec/bike_club_spec.rb
require './lib/biker'
require './lib/ride'
require './lib/bike_club'

RSpec.describe BikeClub do
    before :each do
        @bike_club = BikeClub.new("Riders")
        @biker1 = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        # Adding bikers to the club
        @bike_club.add_biker(@biker1)
        @bike_club.add_biker(@biker2)
    end

    it 'has a name' do
        expect(@bike_club.name).to eq("Riders")
    end

    it 'has an array of bikers' do
        expect(@bike_club.bikers).to eq([@biker1, @biker2])
    end

    it 'can add new bikers' do
        biker3 = Biker.new("Shadeau", 25)
        @bike_club.add_biker(biker3)

        expect(@bike_club.bikers).to include(biker3)
        expect(@bike_club.bikers.length).to eq(3)
    end

    it 'can tell which biker has the most rides' do
        @biker1.learn_terrain!(:hills)
        @biker1.learn_terrain!(:gravel)
        @biker1.log_ride(@ride1, 92.5)
        @biker1.log_ride(@ride1, 91.1)
        @biker2.learn_terrain!(:gravel)
        @biker2.log_ride(@ride2, 60.9)

        expect(@bike_club.most_rides).to eq(@biker1)
    end

    it 'can tell which biker has the best time for a ride' do
        @biker1.learn_terrain!(:hills)
        @biker1.learn_terrain!(:gravel)
        @biker1.log_ride(@ride1, 92.5)
        @biker1.log_ride(@ride1, 91.1)

        @biker2.learn_terrain!(:gravel)
        @biker2.log_ride(@ride2, 60.9)

        expect(@bike_club.best_time(@ride1)).to eq(@biker1)
    end

    it 'can tell which bikers are eligible for ride' do
        @biker1.learn_terrain!(:hills)
        @biker1.learn_terrain!(:gravel)
        @biker2.learn_terrain!(:gravel)

        @biker1.log_ride(@ride1, 92.5)
        @biker2.log_ride(@ride2, 60.9)

        expect(@bike_club.bikers_eligible(@ride1)).to include(@biker1)
        expect(@bike_club.bikers_eligible(@ride2)).to include(@biker2)
    end

    it 'can start a group ride' do
        @biker1.learn_terrain!(:hills)
        @biker2.learn_terrain!(:hills)
    
        eligible_bikers = @bike_club.start_group_ride(@ride1)
    
        expect(eligible_bikers).to include(@biker1, @biker2)
    end

#     it 'can record group ride' do
#         @bike_club = BikeClub.new("Riders")
#         @biker1 = Biker.new("Kenny", 30)
#         @biker2 = Biker.new("Athena", 15)
#         @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
#         @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
#     end
end