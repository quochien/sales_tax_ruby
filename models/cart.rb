class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  # def update_item(item)
  # end

  # def remove_item(item)
  # end
end
