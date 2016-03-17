require 'rails_helper'

RSpec.describe "flights/index", type: :view do
  before(:each) do
    assign(:flights, [
      Flight.create!(
        :from => 1,
        :to => 2,
        :plane_id => ""
      ),
      Flight.create!(
        :from => 1,
        :to => 2,
        :plane_id => ""
      )
    ])
  end

  it "renders a list of flights" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
