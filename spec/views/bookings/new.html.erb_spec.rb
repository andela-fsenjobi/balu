require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      :flight_id => "",
      :passenger_id => ""
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input#booking_flight_id[name=?]", "booking[flight_id]"

      assert_select "input#booking_passenger_id[name=?]", "booking[passenger_id]"
    end
  end
end
