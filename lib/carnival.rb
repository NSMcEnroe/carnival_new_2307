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
end
    