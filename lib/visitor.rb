require_relative 'ride'
class Visitor
  attr_reader :name, :height, :preferences, :spending_money
  def initialize(name, height, starting_money)
    @name = name
    @height = height
    @preferences = []
    @spending_money = starting_money.delete("$").to_i
    #Don't know if this is too much to put up in the starting attributes.  Tried to write a method, but was having trouble having the method read the input for spending_money
  end

  def add_preference(ride_type)
    @preferences << ride_type
  end

  def tall_enough?(height_requirement)
    @height >= height_requirement
  end

  def pay_admission(cost)
    @spending_money -= cost
  end

end