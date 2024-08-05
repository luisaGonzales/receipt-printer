class TaxCalculator < ServiceBase
  IMPORT_TAX = 5.freeze
  BASE_TAX = 10.freeze
  ROUNDING = 0.05.freeze

  def initialize(item_price, quantity, tax_percentage)
    @item_price = item_price
    @quantity = quantity
    @tax_percentage = tax_percentage
  end

  attr_accessor :item_price, :quantity, :tax_percentage

  def call
    return 0 if item_price.zero?

    calculate_tax
  end

  def calculate_tax
    tax = item_price * tax_percentage / 100
    tax = round_tax(tax)

    tax * @quantity
  end

  def round_tax(tax = 0)
    return 0 if tax.zero?
    
    missing_rounding = ROUNDING - (tax % ROUNDING)
    tax += missing_rounding unless missing_rounding >= ROUNDING

    tax
  end
end