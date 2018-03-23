require_relative '../spec_helper'

describe Food do
  context 'local food' do
    let(:good) { described_class.new(name: 'Product 1', price: 123.45, is_imported: false) }

    describe '#basic_sales_tax' do
      it { expect(good.basic_sales_tax).to eq 0.0 }
    end

    describe '#import_duty_sales_tax' do
      it { expect(good.import_duty_sales_tax).to eq 0.0 }
    end

    describe '#total_sales_tax' do
      it { expect(good.total_sales_tax).to eq 0.0 }
    end
  end

  context 'imported food' do
    let(:good) { described_class.new(name: 'Product 1', price: 123.45, is_imported: true) }

    describe '#basic_sales_tax' do
      it { expect(good.basic_sales_tax).to eq 0.0 }
    end

    describe '#import_duty_sales_tax' do
      it { expect(good.import_duty_sales_tax).to eq 0.05 }
    end

    describe '#total_sales_tax' do
      it { expect(good.total_sales_tax).to eq 0.05 }
    end
  end
end
