require 'rails_helper'

RSpec.describe "incidences/edit", type: :view do
  before(:each) do
    @incidence = assign(:incidence, Incidence.create!(
      :body => "MyString",
      :reservation => nil
    ))
  end

  it "renders the edit incidence form" do
    render

    assert_select "form[action=?][method=?]", incidence_path(@incidence), "post" do

      assert_select "input#incidence_body[name=?]", "incidence[body]"

      assert_select "input#incidence_reservation_id[name=?]", "incidence[reservation_id]"
    end
  end
end
