require 'rails_helper'

RSpec.describe "passengers/index", type: :view do
  before(:each) do
    assign(:passengers, [
      Passenger.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :address => "MyText"
      ),
      Passenger.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :address => "MyText"
      )
    ])
  end

  it "renders a list of passengers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
