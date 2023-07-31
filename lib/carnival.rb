class Carnival
  @@total_revenues = 0
  attr_reader :duration, :rides
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def self.total_revenues
    @@total_revenues
  end

  def total_revenue
    t_r = 0
    @rides.each do |ride|
      t_r += ride.total_revenue
      @@total_revenues += ride.total_revenue
    end
    t_r
  end

  def most_popular_ride
    popularity_list = Hash.new(0)
    @rides.each do |ride|
      popularity_list[ride] = ride.total_revenue / ride.admission_fee
    end
    popularity_list.sort_by do |ride, popularity|
      popularity
    end
    popularity_list.keys[0]
  end

  def most_profitable_ride
    profit_list = Hash.new(0)
    @rides.each do |ride|
      profit_list[ride] = ride.total_revenue 
    end
    profit_list.sort_by do |ride, profit|
      profit
    end
    profit_list.keys[0]
  end


end
    