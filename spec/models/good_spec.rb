require_relative '../spec_helper'

describe Good do
  context 'local good' do
    let(:good) { described_class.new(name: 'Product 1', price: 123.45, is_imported: false) }

    describe '#initialize' do
      it { expect(good.name).to eq 'Product 1' }
      it { expect(good.price).to eq 123.45 }
      it { expect(good.is_imported).to eq false }
    end

    describe '#basic_sales_tax' do
      it { expect(good.basic_sales_tax).to eq 0.1 }
    end

    describe '#import_duty_sales_tax' do
      it { expect(good.import_duty_sales_tax).to eq 0.0 }
    end

    describe '#total_sales_tax' do
      it { expect(good.total_sales_tax).to eq 0.1 }
    end
  end

  context 'imported good' do
    let(:good) { described_class.new(name: 'Product 1', price: 123.45, is_imported: true) }

    describe '#initialize' do
      it { expect(good.name).to eq 'Product 1' }
      it { expect(good.price).to eq 123.45 }
      it { expect(good.is_imported).to eq true }
    end

    describe '#basic_sales_tax' do
      it { expect(good.basic_sales_tax).to eq 0.1 }
    end

    describe '#import_duty_sales_tax' do
      it { expect(good.import_duty_sales_tax).to eq 0.05 }
    end

    describe '#total_sales_tax' do
      it { expect(good.total_sales_tax).to eq 0.15 }
    end
  end
end
