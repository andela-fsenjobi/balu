require 'rails_helper'

RSpec.describe "flights/edit", type: :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      :from => 1,
      :to => 1,
      :plane_id => ""
    ))
  end

  it "renders the edit flight form" do
    render

    assert_select "form[action=?][method=?]", flight_path(@flight), "post" do

      assert_select "input#flight_from[name=?]", "flight[from]"

      assert_select "input#flight_to[name=?]", "flight[to]"

      assert_select "input#flight_plane_id[name=?]", "flight[plane_id]"
    end
  end
end
