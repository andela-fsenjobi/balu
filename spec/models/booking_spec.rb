require "rails_helper"

RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    expect(build(:booking)).to be_valid
  end

  let(:booking) { build(:booking) }

  it { expect(booking).to respond_to(:flight) }
  it { expect(booking).to respond_to(:passengers) }
  it { expect(booking.flight).to be_a(Flight) }

  let(:saved_booking) { create(:booking) }
end
