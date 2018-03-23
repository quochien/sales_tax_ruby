require_relative '../spec_helper'

describe ReceiptCalculator do
  let(:cart) { Cart.new }
  let(:good1) { Good.new(name: 'imported bottle of perfume', price: 27.99, is_imported: true) }
  let(:good2) { Good.new(name: 'bottle of perfume', price: 18.99, is_imported: false) }
  let(:good3) { Medicine.new(name: 'packet of headache pills', price: 9.75, is_imported: false) }
  let(:good4) { Food.new(name: 'box of imported chocolates', price: 11.25, is_imported: true) }

  let(:item1) { Item.new(good: good1, quantity: 1) }
  let(:item2) { Item.new(good: good2, quantity: 1) }
  let(:item3) { Item.new(good: good3, quantity: 1) }
  let(:item4) { Item.new(good: good4, quantity: 1) }

  let(:service) { described_class.new(cart: cart) }

  before do
    cart.add_item(item1)
    cart.add_item(item2)
    cart.add_item(item3)
    cart.add_item(item4)
  end

  describe '#perform' do
    it 'calculates amounts' do
      service.perform
      expect(item1.amount).to eq 32.19
      expect(item1.sales_tax_amount).to eq 4.2
      expect(item2.amount).to eq 20.89
      expect(item2.sales_tax_amount).to eq 1.9
      expect(item3.amount).to eq 9.75
      expect(item3.sales_tax_amount).to eq 0.0
      expect(item4.amount).to eq 11.85
      expect(item4.sales_tax_amount).to eq 0.6
    end
  end

  describe '#print' do
    let(:receipt) do
      "1, imported bottle of perfume, 32.19\n" \
      "1, bottle of perfume, 20.89\n" \
      "1, packet of headache pills, 9.75\n" \
      "1, box of imported chocolates, 11.85\n" \
      "Sales Taxes: 6.70\n" \
      'Total: 74.68'
    end

    it 'returns the receipt' do
      service.perform
      expect(service.print).to eq receipt
    end
  end
end
