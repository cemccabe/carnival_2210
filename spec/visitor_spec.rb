require './lib/visitor'
require 'rspec'

RSpec.describe do
  before :each do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  it 'exists and has a default name, height, and spending money' do
    expect(@visitor1).to be_a(Visitor)
    expect(@visitor1.name).to eq('Bruce')
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq('$10')
  end

  it 'has an empty default preferences array' do
    expect(@visitor1.preferences).to eq([])
  end

  it 'stores Visitor preferences' do
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:water)
    
    expect(@visitor1.preferences).to eq([:gentle, :water])
  end
end