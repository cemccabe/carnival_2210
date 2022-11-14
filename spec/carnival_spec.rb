require './lib/visitor'
require './lib/ride'
require './lib/carnival'
require 'rspec'

RSpec.describe do
  before :each do
    @carnival1 = Carnival.new({ duration: '4 days', rides: ['Carousel', 'Ferris Wheel'] })
  end

  it 'exists and has a duration and list of rides' do
    expect(@carnival1).to be_a(Carnival)
    expect(@carnival1.duration).to eq('4 days')
    expect(@carnival1.rides).to eq(['Carousel', 'Ferris Wheel'])
  end
end