require_relative '../spec_helper'

describe Cart do
  let(:cart) { described_class.new }

  describe '#initialize' do
    it { expect(cart.items).to eq [] }
  end

  describe '#add_item' do
    let(:good1) { Good.new(name: 'Product 1', price: 123.45, is_imported: false) }
    let(:good2) { Good.new(name: 'Product 2', price: 123.45, is_imported: false) }
    let(:item1) { Item.new(good: good1, quantity: 1) }
    let(:item2) { Item.new(good: good2, quantity: 1) }

    it 'adds items to cart' do
      cart.add_item(item1)
      cart.add_item(item2)

      expect(cart.items).to eq [item1, item2]
    end
  end
end
