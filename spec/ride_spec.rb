require './lib/visitor'
require './lib/ride'
require 'rspec'

RSpec.describe do
  before :each do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
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
end