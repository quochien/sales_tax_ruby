class ReceiptCalculator
  def initialize(cart:)
    @cart = cart
    @receipt = Receipt.new(items: cart.items)
  end

  def perform
    @cart.items.each do |item|
      item.calculate_amount
      @receipt.total_amount += item.amount
      @receipt.total_sales_tax_amount += item.sales_tax_amount
    end
  end

  def print
    output_string = ''
    @receipt.items.each do |item|
      output_string += "#{item.quantity}, #{item.good.name}, #{'%.02f' % item.amount}\n"
    end
    output_string += "Sales Taxes: #{'%.02f' % @receipt.total_sales_tax_amount}\n"
    output_string += "Total: #{'%.02f' % @receipt.total_amount}"
    output_string
  end

  # def to_csv
  # end
end
