require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
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

  describe "#total_revenue" do
    it "can calculate total revenue of the carnival" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      expect(@carnival.total_revenue).to eq(5)
    end
  end

  describe "#most_popular_ride" do
    it "can determine the carnivals most popular ride" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      expect(@carnival.most_popular_ride).to eq(@ride1)
    end
  end


end
