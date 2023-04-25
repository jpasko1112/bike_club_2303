require 'spec_helper'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new('Athena', 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#exists' do
    it 'is an instance of Biker' do
      expect(@biker).to be_a(Biker)
    end
  end

  describe '#name' do
    it 'returns the name of the Biker' do
      expect(@biker.name).to eq('Kenny')
    end
  end

  describe '#max_distance' do
    it 'returns the maximum distance' do
      expect(@biker.max_distance).to eq(30)
    end
  end

  describe '#rides' do
    it 'is a hash that holds ride info' do
      expect(@biker.rides).to eq({})
    end
  end

  describe '#acceptable_terrain' do
    it 'returns the acceptable terrain' do
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain!(:terrain_type)' do
    it 'can add terrain info to acceptable_terrain' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride(ride, time)' do
    it 'can log a ride with a time' do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.rides).to be_a(Hash)
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 67.0)
      # expect(@biker2.log_ride)
    end
  end

  describe '#personal_record(ride)' do
    it 'retruns the best time per given ride' do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end
end