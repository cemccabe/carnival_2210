require './lib/visitor'
require './lib/ride'
require './lib/carnival'
require 'rspec'

RSpec.describe do
  before :each do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @carnival1 = Carnival.new('4 days', [@ride1, @ride2])
  end

  it 'exists and has a duration and list of rides' do
    expect(@carnival1).to be_a(Carnival)
    expect(@carnival1.duration).to eq('4 days')
    expect(@carnival1.rides).to eq([@ride1, @ride2])
  end

  describe 'most popular ride and total carnival revenue' do
    before :each do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)

      @ride2.board_rider(@visitor3)
      @ride2.board_rider(@visitor3)
    end

    it 'returns the most popular ride (lists multiple if there is a tie)' do
      expect(@carnival1.most_popular_ride).to eq([@ride1])

      @ride2.board_rider(@visitor3)

      # can't figure out functionality of adding a tied Ride to the list
      expect(@carnival1.most_popular_ride).to eq([@ride1, @ride2])
    end

    it 'returns the total carnival revenue' do
      expect(@carnival1.carnival_revenue).to eq(13)
    end
  end
end