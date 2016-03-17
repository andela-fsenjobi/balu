require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      :price => "9.99",
      :airline_id => nil
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input#coupon_price[name=?]", "coupon[price]"

      assert_select "input#coupon_airline_id_id[name=?]", "coupon[airline_id_id]"
    end
  end
end
