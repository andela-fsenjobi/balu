require 'rails_helper'

RSpec.describe "airports/show", type: :view do
  before(:each) do
    @airport = assign(:airport, Airport.create!(
      :name => "Name",
      :city_id => 1,
      :email => "Email",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
  end
end
