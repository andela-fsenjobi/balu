require 'rails_helper'

RSpec.describe "passengers/edit", type: :view do
  before(:each) do
    @passenger = assign(:passenger, Passenger.create!(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyText"
    ))
  end

  it "renders the edit passenger form" do
    render

    assert_select "form[action=?][method=?]", passenger_path(@passenger), "post" do

      assert_select "input#passenger_name[name=?]", "passenger[name]"

      assert_select "input#passenger_email[name=?]", "passenger[email]"

      assert_select "input#passenger_phone[name=?]", "passenger[phone]"

      assert_select "textarea#passenger_address[name=?]", "passenger[address]"
    end
  end
end
