require_relative './models/good'
require_relative './models/exempt_good'
require_relative './models/food'
require_relative './models/book'
require_relative './models/medicine'
require_relative './models/item'
require_relative './models/customer'
require_relative './models/cart'
require_relative './models/receipt'
require_relative './services/receipt_calculator'

# order 1
customer = Customer.new
good1 = Book.new(name: 'book', price: 12.49, is_imported: false)
item1 = Item.new(good: good1, quantity: 1)
customer.add_item_to_cart(item1)
good2 = Good.new(name: 'music cd', price: 14.99, is_imported: false)
item2 = Item.new(good: good2, quantity: 1)
customer.add_item_to_cart(item2)
good3 = Food.new(name: 'chocolate bar', price: 0.85, is_imported: false)
item3 = Item.new(good: good3, quantity: 1)
customer.add_item_to_cart(item3)
customer.purchase
puts customer.receipt_output

# order 2
customer = Customer.new
good1 = Food.new(name: 'imported box of chocolates', price: 10.00, is_imported: true)
item1 = Item.new(good: good1, quantity: 1)
customer.add_item_to_cart(item1)
good2 = Good.new(name: 'imported bottle of perfume', price: 47.50, is_imported: true)
item2 = Item.new(good: good2, quantity: 1)
customer.add_item_to_cart(item2)
customer.purchase
puts customer.receipt_output

# order 3
customer = Customer.new
good1 = Good.new(name: 'imported bottle of perfume', price: 27.99, is_imported: true)
item1 = Item.new(good: good1, quantity: 1)
customer.add_item_to_cart(item1)
good2 = Good.new(name: 'bottle of perfume', price: 18.99, is_imported: false)
item2 = Item.new(good: good2, quantity: 1)
customer.add_item_to_cart(item2)
good3 = Medicine.new(name: 'packet of headache pills', price: 9.75, is_imported: false)
item3 = Item.new(good: good3, quantity: 1)
customer.add_item_to_cart(item3)
good4 = Food.new(name: 'box of imported chocolates', price: 11.25, is_imported: true)
item4 = Item.new(good: good4, quantity: 1)
customer.add_item_to_cart(item4)
customer.purchase
puts customer.receipt_output
