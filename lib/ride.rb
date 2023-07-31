require_relative 'visitor'
class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log
  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @rider_log = Hash.new(0)
  end

  def total_revenue
    @rider_log.values.sum * @admission_fee
  end

  def board_rider(guest)
    if guest.preferences.include?(@excitement) && guest.spending_money >= @admission_fee
      @rider_log[guest] += 1
      guest.pay_admission(@admission_fee)
      total_revenue
    end
  end

end
