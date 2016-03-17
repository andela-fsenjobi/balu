require 'rails_helper'

RSpec.describe "passengers/show", type: :view do
  before(:each) do
    @passenger = assign(:passenger, Passenger.create!(
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :address => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
  end
end
