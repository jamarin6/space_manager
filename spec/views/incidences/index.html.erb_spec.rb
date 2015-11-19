require 'rails_helper'

RSpec.describe "incidences/index", type: :view do
  before(:each) do
    assign(:incidences, [
      Incidence.create!(
        :body => "Body",
        :reservation => nil
      ),
      Incidence.create!(
        :body => "Body",
        :reservation => nil
      )
    ])
  end

  it "renders a list of incidences" do
    render
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
