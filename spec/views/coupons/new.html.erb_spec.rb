require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      :price => "9.99",
      :airline_id => nil
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input#coupon_price[name=?]", "coupon[price]"

      assert_select "input#coupon_airline_id_id[name=?]", "coupon[airline_id_id]"
    end
  end
end
