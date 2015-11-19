require 'rails_helper'

RSpec.describe "incidences/show", type: :view do
  before(:each) do
    @incidence = assign(:incidence, Incidence.create!(
      :body => "Body",
      :reservation => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(//)
  end
end
