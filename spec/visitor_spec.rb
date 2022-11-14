require './lib/visitor'
require 'rspec'

RSpec.describe do
  before :each do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  it 'exists and has a default name, age, and spending money' do
    expect(@visitor1).to be_a(Visitor)
    expect(@visitor1.name).to eq('Bruce')
    expect(@visitor1.age).to eq(54)
    expect(@visitor1.spending_money).to eq('$10')
  end
end