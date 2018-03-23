class Customer
  attr_reader :cart, :receipt_output

  def initialize
    @cart = Cart.new
  end

  def add_item_to_cart(item)
    @cart.add_item(item)
  end

  def purchase
    service.perform
    @receipt_output = service.print
  end

  private

  def service
    @service ||= ReceiptCalculator.new(cart: @cart)
  end
end
