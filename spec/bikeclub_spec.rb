require './lib/bike_club'
require './lib/biker'
require './lib/ride'

RSpec.describe BikeClub do
    describe '#instatiate' do
        it 'is a bikeclub' do
            club = BikeClub.new("Colorado Bikers")

            expect(club).to be_a(BikeClub)
        end
    end

    describe '#initialize' do
        it 'a bikeclub has a name and list of bikers' do
            club = BikeClub.new("Colorado Bikers")

            expect(club.name).to eq("Colorado Bikers")
            expect(club.bikers).to eq([])
        end
    end

    describe '#join_club' do
        it 'confirms bikers can join the club' do
            club = BikeClub.new("Colorado Bikers")
            biker_1 = Biker.new("Kenny", 30)
            biker_2 = Biker.new("Matt", 50)

            club.add_biker(biker_1)
            club.add_biker(biker_2)

            expect(club.bikers).to eq([biker_1, biker_2])
        end
    end

    describe '#most_rides' do
        it 'confirms which biker in the club has the most rides' do
            club = BikeClub.new("Colorado Bikers")
            biker_1 = Biker.new("Kenny", 30)
            biker_2 = Biker.new("Matt", 50)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            ride3 = Ride.new({name: "Columbine Trail", distance: 20.5, loop: false, terrain: :gravel})

            biker_1.learn_terrain!(:gravel)
            biker_1.learn_terrain!(:hills)

            biker_2.learn_terrain!(:gravel)
            biker_2.learn_terrain!(:hills)

            biker_1.log_ride(ride1, 92.5)
            biker_1.log_ride(ride2, 60.9)
            biker_2.log_ride(ride3, 95.0)

            club.add_biker(biker_1)
            club.add_biker(biker_2)

            expect(club.most_rides).to eq(biker_1)
        end
    end

    describe '#best_time' do
        it 'confirms which biker has the best time of a given ride' do
            club = BikeClub.new("Colorado Bikers")
            biker_1 = Biker.new("Kenny", 30)
            biker_2 = Biker.new("Matt", 50)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            ride3 = Ride.new({name: "Columbine Trail", distance: 20.5, loop: false, terrain: :gravel})

            biker_1.learn_terrain!(:gravel)
            biker_1.learn_terrain!(:hills)

            biker_2.learn_terrain!(:gravel)
            biker_2.learn_terrain!(:hills)

            biker_1.log_ride(ride1, 92.5)
            biker_1.log_ride(ride2, 60.9)
            biker_2.log_ride(ride1, 62.0)
            biker_2.log_ride(ride3, 95.0)

            club.add_biker(biker_1)
            club.add_biker(biker_2)

            expect(club.best_time(ride1)).to eq(biker_2)
        end
    end

    describe '#bikers_eligible' do
        it 'returns a list of bikers that are elibable for a ride based on distance and terrain' do
            club = BikeClub.new("Colorado Bikers")
            biker_1 = Biker.new("Kenny", 30)
            biker_2 = Biker.new("Matt", 50)
            biker_3 = Biker.new("Jono", 40)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            ride3 = Ride.new({name: "Columbine Trail", distance: 20.5, loop: false, terrain: :gravel})

            biker_1.learn_terrain!(:gravel)

            biker_2.learn_terrain!(:gravel)
            biker_2.learn_terrain!(:hills)

            biker_3.learn_terrain!(:hills)

            club.add_biker(biker_1)
            club.add_biker(biker_2)
            club.add_biker(biker_3)

            expect(club.bikers_eligible(ride1)).to eq([biker_2, biker_3])
        end
    end
end

