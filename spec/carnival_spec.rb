require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
  end

  describe "#initialize" do
    it "can initialize and read attributes" do
      expect(@carnival).to be_a Carnival
      expect(@carnival.duration).to eq(14)
      expect(@carnival.rides).to eq([])
    end
  end

  describe "#add_ride" do
    it "can add rides" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      expect(@carnival.rides).to eq([@ride1, @ride2])
    end
  end

end
