require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)

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
  end

  describe '#board_ride' do
    it "can allow visitors to board a ride" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
    end
  end


end

