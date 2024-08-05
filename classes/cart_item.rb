require './services/tax_calculator'

class CartItem
  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end

  attr_accessor :item, :quantity

  def calculated_tax
    @calculated_tax ||= calculate_tax
  end

  def name
    item.name
  end

  def calculate_tax
    base_tax = 0
    imported_tax = 0

    base_tax = TaxCalculator.new(item.price, quantity, TaxCalculator::BASE_TAX).call unless item.free_duty
    imported_tax = TaxCalculator.new(item.price, quantity, TaxCalculator::IMPORT_TAX).call if item.imported
    
    base_tax + imported_tax
  end

  def total_price
    item.price * quantity + calculated_tax
  end
end