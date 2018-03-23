class Receipt
  attr_accessor :items, :total_amount, :total_sales_tax_amount

  def initialize(items:)
    @items = items
    @total_amount = 0
    @total_sales_tax_amount = 0
  end
end
