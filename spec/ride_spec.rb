require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
  end

  describe '#initialize' do
    it "can initialize and have readable attributes" do
      expect(@ride1).to be_a Ride
      expect(@ride1.name).to eq("Carousel")
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
      expect(@ride1.rider_log).to eq({})
    end
  end

  describe '#total_revenue' do
    it "can state the ride's initial total revenue" do
      expect(@ride1.total_revenue).to eq(0)
    end

    it "can state the total revenue after riders have entered" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      expect(@ride1.total_revenue).to eq(3)
    end

    it "can work in different scenarios" do
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      expect(@ride3.total_revenue).to eq(2)
    end

  end

  describe '#board_ride' do
    it "can allow visitors to board a ride" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
    end

    it "can allow visitors to board another ride" do
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      expect(@ride3.rider_log).to eq({@visitor3 => 1})
    end
  end


end

