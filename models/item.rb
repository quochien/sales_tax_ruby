class Item
  attr_reader :good, :quantity, :amount, :sales_tax_amount

  def initialize(good:, quantity:)
    @good = good
    @quantity = quantity
  end

  def calculate_amount
    amount = good.price * quantity
    @sales_tax_amount = (amount * good.total_sales_tax * 20).ceil.to_f / 20
    @amount = (amount + @sales_tax_amount).round(2)
  end
end
