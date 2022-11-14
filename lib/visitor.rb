class Visitor
  attr_reader :name, :age, :spending_money

  def initialize(name, age, spending_money)
    @name = name
    @age = age
    @spending_money = spending_money
  end
end
