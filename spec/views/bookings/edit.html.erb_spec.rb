require 'rails_helper'

RSpec.describe "bookings/edit", type: :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
      :flight_id => "",
      :passenger_id => ""
    ))
  end

  it "renders the edit booking form" do
    render

    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do

      assert_select "input#booking_flight_id[name=?]", "booking[flight_id]"

      assert_select "input#booking_passenger_id[name=?]", "booking[passenger_id]"
    end
  end
end
