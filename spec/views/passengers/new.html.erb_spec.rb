require 'rails_helper'

RSpec.describe "passengers/new", type: :view do
  before(:each) do
    assign(:passenger, Passenger.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyText"
    ))
  end

  it "renders new passenger form" do
    render

    assert_select "form[action=?][method=?]", passengers_path, "post" do

      assert_select "input#passenger_name[name=?]", "passenger[name]"

      assert_select "input#passenger_email[name=?]", "passenger[email]"

      assert_select "input#passenger_phone[name=?]", "passenger[phone]"

      assert_select "textarea#passenger_address[name=?]", "passenger[address]"
    end
  end
end
