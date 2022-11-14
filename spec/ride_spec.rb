require './lib/visitor'
require './lib/ride'
require 'rspec'

RSpec.describe do
  before :each do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
  end

  it 'exists and has a default name, min height requirement, admission fee, excitement attibute' do
    expect(@ride1).to be_a(Ride)
    expect(@ride1.name).to eq('Carousel')
    expect(@ride1.min_height).to eq(24)
    expect(@ride1.admission_fee).to eq(1)
    expect(@ride1.excitement).to eq(:gentle)
  end

  it 'has a default total revenue counter that starts at 0' do
    expect(@ride1.total_revenue).to eq(0)
  end

  it 'has a default rider log that is an empty hash' do
    expect(@ride1.rider_log).to eq({})
  end

  it 'stores boarded riders in the rider_log using #board_riders method' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)

    expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
  end
end