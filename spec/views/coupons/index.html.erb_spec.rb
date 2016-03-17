require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        :price => "9.99",
        :airline_id => nil
      ),
      Coupon.create!(
        :price => "9.99",
        :airline_id => nil
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
