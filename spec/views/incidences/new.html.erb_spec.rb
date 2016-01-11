require 'rails_helper'

RSpec.describe "incidences/new", type: :view do
  before(:each) do
    assign(:incidence, Incidence.new(
      :body => "MyString",
      :reservation => nil
    ))
  end

  it "renders new incidence form" do
    render

    assert_select "form[action=?][method=?]", incidences_path, "post" do

      assert_select "input#incidence_body[name=?]", "incidence[body]"

      assert_select "input#incidence_reservation_id[name=?]", "incidence[reservation_id]"
    end
  end
end
