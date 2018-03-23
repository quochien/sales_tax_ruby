require_relative '../spec_helper'

describe Item do
  let(:item) { described_class.new(good: good, quantity: quantity) }

  describe '#calculate_amount' do
    context 'good is a local book' do
      let(:good) { Book.new(name: 'book', price: 12.49, is_imported: false) }
      let(:quantity) { 1 }

      it 'calculates amount and sales tax rounded up to the nearest 0.05' do
        item.calculate_amount
        expect(item.amount).to eq 12.49
        expect(item.sales_tax_amount).to eq 0.0
      end
    end

    context 'good is a imported book' do
      let(:good) { Book.new(name: 'book', price: 12.49, is_imported: true) }
      let(:quantity) { 1 }

      it 'calculates amount and sales tax rounded up to the nearest 0.05' do
        item.calculate_amount
        expect(item.amount).to eq 13.14
        expect(item.sales_tax_amount).to eq 0.65
      end
    end

    context 'quantity > 1' do
      let(:good) { Book.new(name: 'book', price: 12.49, is_imported: true) }
      let(:quantity) { 2 }

      it 'calculates amount and sales tax rounded up to the nearest 0.05' do
        item.calculate_amount
        expect(item.amount).to eq 26.23
        expect(item.sales_tax_amount).to eq 1.25
      end
    end
  end
end
