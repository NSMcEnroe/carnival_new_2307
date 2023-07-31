class Visitor
  attr_reader :name, :height, :preferences, :spending_money
  def initialize(name, height, starting_money)
    @name = name
    @height = height
    @preferences = []
    @spending_money = starting_money.delete("$").to_i
  end

  def add_preference(ride_type)
    @preferences << ride_type
  end

  def tall_enough?(height_requirement)
    @height >= height_requirement
  end

end