require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order) { build(:order) }

  describe ".has_secure_number(attribute)" do
    describe "generate unique random number string for specific attribute" do
      context "successful" do
        it "attributes has value" do
          order.save

          expect(order.order_no).to be_present
          expect(order.order_no.size).to eq(20)
          expect(order.order_no_with_prefix).to start_with("PN_")
          expect(order.order_no_with_suffix).to end_with("_SN")
          expect(order.order_no_with_specific_length.size).to eq(16)
        end

        it "attributes has value even failed with 9 times" do
          allow(Order).to receive(:exists?).and_return(*Array.new(10){|i| i == 9 ? false : true })

          order.save

          expect(order.order_no).to be_present
          expect(order.order_no.size).to eq(20)
          expect(order.order_no_with_prefix).to start_with("PN_")
          expect(order.order_no_with_suffix).to end_with("_SN")
          expect(order.order_no_with_specific_length.size).to eq(16)
        end
      end

      context "failed" do
        it "raise an exception when with 10 attempts is reached" do
          expect {
            allow(Order).to receive(:exists?).and_return(*Array.new(10, true))
            order.save
          }.to raise_error(StandardError)
        end
      end
    end
  end

  describe "#regenerate secure number" do
    it "generate a new secure number" do
      order.save

      old_order_no = order.order_no
      order.regenerate_order_no

      expect(order.order_no).to be_present
      expect(order.order_no).to_not eq(old_order_no)
    end
  end

end
