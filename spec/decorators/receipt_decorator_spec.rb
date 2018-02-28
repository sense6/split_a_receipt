require 'rails_helper'

RSpec.describe ReceiptDecorator do
  receipt = FactoryBot.create(:receipt, created_at: Date.new(2015,05,24))

  describe "created_at" do
    decorated_receipt = ReceiptDecorator.new(receipt)
    it { expect(decorated_receipt.created_at).to eq("05/24/2015") }
  end
end
