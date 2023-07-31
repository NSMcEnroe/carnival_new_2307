class Carnival
  attr_reader :duration, :rides
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def total_revenue
    t_r = 0
    @rides.each do |ride|
      t_r += ride.total_revenue
    end
    t_r
  end

  def most_popular_ride
    mpr_list = Hash.new(0)
    @rides.each do |ride|
      mpr_list[ride] = ride.total_revenue / ride.admission_fee
    end
    mpr_list.sort_by do |ride, popularity|
      popularity
    end
    mpr_list.keys[0]
  end
end
    