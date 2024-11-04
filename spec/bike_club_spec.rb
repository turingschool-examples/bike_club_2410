require_relative 'spec_helper'

RSpec.describe BikeClub do
  describe '#initialize' do
    it 'exists' do
      bike_club = BikeClub.new("Hell's Angels")
      expect(bike_club).to be_an_instance_of(BikeClub)
    end

    it 'has attributes' do
      bike_club = BikeClub.new("Hell's Angels")
      expect(bike_club.name).to eq("Hell's Angels")
    end

    it 'can have different attributes' do
      bike_club2 = BikeClub.new("Rolling Thunder")
      expect(bike_club.name).to eq("Rolling Thunder")
    end

    it 'has a default attribute' do
      bike_club = BikeClub.new("Hell's Angels")
      bike_club2 = BikeClub.new("Rolling Thunder")

      expect(bike_club.bikers).to eq([])
      expect(bike_club2.bikers).to eq([])
    end
  end

  describe '#add_biker' do
    it 'can add a biker to its bikers list' do
      bike_club = BikeClub.new("Hell's Angels")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)

      expect(bike_club.bikers).to eq([])
      bike_club.add_biker(biker)
      bike_club.add_biker(biker2)
      expect(bike_club.bikers).to eq([biker, biker2])
    end
  end

  describe '#most_rides' do
    it 'returns the biker with the most rides' do
      bike_club = BikeClub.new("Hell's Angels")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:hills)
      biker.learn_terrain!(:gravel)
      biker2.learn_terrain!(:gravel)

      biker.log_ride(ride1, 91.2)
      biker.log_ride(ride2, 60.6)
      biker2.log_ride(ride2, 59.7)

      expect(bike_club.most_rides).to eq(biker)
    end
  end
end