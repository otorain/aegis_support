require_relative "../../../test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @order = Order.new
  end

  test "generate unique secure number successful" do
    @order.save
    assert_not_nil @order.order_no
  end

  test "regenerate the secure number for the attribute" do
    @order.save
    old_value = @order.order_no
    @order.regenerate_order_no

    assert_not_equal @order.order_no, old_value
  end

  test "raise an exception when with 10 attempts is reached" do
    Order.stubs(:exists?).returns(*Array.new(10, true))
    assert_raise(StandardError) do
      @order.save
    end
  end

  test "generate unique secure number successful after 9 attempts is reached" do
    Order.stubs(:exists?).returns(*Array.new(10){|i| i == 9 ? false : true })
    @order.save

    assert_not_nil @order.order_no
  end

end
