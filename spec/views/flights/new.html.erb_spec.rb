require 'rails_helper'

RSpec.describe "flights/new", type: :view do
  before(:each) do
    assign(:flight, Flight.new(
      :from => 1,
      :to => 1,
      :plane_id => ""
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do

      assert_select "input#flight_from[name=?]", "flight[from]"

      assert_select "input#flight_to[name=?]", "flight[to]"

      assert_select "input#flight_plane_id[name=?]", "flight[plane_id]"
    end
  end
end
