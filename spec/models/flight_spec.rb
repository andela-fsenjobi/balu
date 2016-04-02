require "rails_helper"

RSpec.describe Flight, type: :model do
  it "has a valid factory" do
    expect(build(:flight)).to be_valid
  end

  let(:flight) { build(:flight) }

  it { expect(flight).to respond_to(:bookings) }
  it { expect(flight).to respond_to(:plane) }
  it { expect(flight).to respond_to(:destination) }
  it { expect(flight).to respond_to(:airport) }
  it { expect(flight).to respond_to(:passengers) }
end
