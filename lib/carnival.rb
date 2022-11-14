class Carnival
  attr_reader :duration, :rides

  def initialize(attributes)
    @duration = attributes[:duration]
    @rides = attributes[:rides]
  end
end