class Carnival
  attr_reader :duration, :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end

  def most_popular_ride
    arr = []
    arr << @rides.max_by do |ride|
      ride.rider_log.values.sum
    end
  end
end