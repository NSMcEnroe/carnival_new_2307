require './lib/visitor'

RSpec.describe Visitor do 
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
  end

  describe '#initialize' do
    it "can initialize with starting attributes" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1).to be_a Visitor
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end

  describe '#add_preferences' do
    it "can add ride type preferences to a visitor" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)
      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe '#tall_enough?' do
    it "can determine if a visitor is tall enough" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
  end

  describe '#spending_money' do
    it "will subtract admission fees from spending_money" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      expect(@visitor1.spending_money).to eq(8)
      expect(@visitor2.spending_money).to eq(4)
    end
  end

end