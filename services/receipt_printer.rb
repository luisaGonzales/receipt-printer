require './services/service_base'
require './classes/cart'

class ReceiptPrinter < ServiceBase
  def initialize(items)
    @items = items
  end

  def call
    print_receipt
  end

  private

  attr_reader :items, :cart

  def cart
    @cart = Cart.new(items)
  end

  def print_receipt
    render_items
    render_taxes
    render_total
  end

  def render_items
    cart.cart_items.each do |item|
      puts render_item(item)
    end
  end

  def render_item(item)
    "#{item.quantity} #{item.name}: #{print_amount(item.total_price)}"
  end

  def render_taxes
    puts "Sales Taxes: #{print_amount(cart.total_sales_tax)}"
  end

  def render_total
    puts "Total: #{print_amount(cart.total_price)}"
  end

  def print_amount(amount)
    sprintf('%.2f', amount)
  end
end