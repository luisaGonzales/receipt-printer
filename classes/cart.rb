require './classes/cart_item'
require './classes/item'

class Cart
  def initialize(items)
    @items = items
    @cart_items = get_cart_items
  end

  attr_reader :items, :cart_items

  def get_cart_items
    cart_items = []

    items.each do |item|
      quantity = item[:quantity]
      item = Item.new(item[:name], item[:price])
      cart_items.push(CartItem.new(item, quantity))
    end

    cart_items
  end

  def total_sales_tax
    cart_items.inject(0) { |sum, item| sum + item.calculated_tax }
  end

  def total_price
    cart_items.inject(0) { |sum, item| sum + item.total_price }
  end
end