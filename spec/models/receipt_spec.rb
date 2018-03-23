require_relative '../spec_helper'

describe Receipt do
  let(:receipt) { described_class.new(items: []) }

  describe '#initialize' do
    specify do
      expect(receipt.items).to eq []
      expect(receipt.total_amount).to eq 0
      expect(receipt.total_sales_tax_amount).to eq 0
    end
  end
end
