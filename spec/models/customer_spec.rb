require_relative '../spec_helper'

describe Customer do
  let(:customer) { described_class.new }
  let(:good) { Good.new(name: 'Product 1', price: 123.45, is_imported: false) }
  let(:item) { Item.new(good: good, quantity: 1) }

  describe '#add_item_to_cart' do
    before { customer.add_item_to_cart(item) }

    it { expect(customer.cart.items).to eq [item] }
  end

  describe '#purchase' do
    before do
      allow_any_instance_of(ReceiptCalculator).to receive(:perform) { true }
      allow_any_instance_of(ReceiptCalculator).to receive(:print) { 'test output' }
    end

    it 'purchases and receive receipt' do
      expect(ReceiptCalculator).to receive(:new).with(cart: customer.cart).and_call_original
      customer.purchase
      expect(customer.receipt_output).to eq 'test output'
    end
  end
end
