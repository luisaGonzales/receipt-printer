class Item
  def initialize(name, price)
    @name = name
    @price = price
  end

  attr_reader :name, :price

  def imported
    name.include?('imported')
  end

  def free_duty
    name.include?('book') || name.include?('chocolate') || name.include?('pills')
  end
end