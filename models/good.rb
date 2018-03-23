class Good
  attr_reader :name, :price, :is_imported

  def initialize(name:, price:, is_imported:)
    @name = name
    @price = price
    @is_imported = is_imported
  end

  def basic_sales_tax
    0.1
  end

  def import_duty_sales_tax
    is_imported ? 0.05 : 0.0
  end

  def total_sales_tax
    (basic_sales_tax + import_duty_sales_tax).round(2)
  end
end
