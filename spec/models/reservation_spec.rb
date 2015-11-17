require 'rails_helper'

RSpec.describe Reservation, type: :model do
  
  before :each do
    @reservation = Reservation.create!
  end

  describe "incidences" do
    # .to eq([])

    it "should be returned as an array" do
      expect(@reservation.incidences).to be_kind_of(Array)
    end

    it "should be able to add incidence" do
      @reservation.add_incidence "incidence 1"
      @reservation.add_incidence "incidence 2"
      expect(@reservation.incidences).to include("incidence 1")
      expect(@reservation.incidences).to include("incidence 2")
    end

    it "should be able to remove incidence" do
      @reservation.add_incidence "incidence 1"
      expect(@reservation.incidences).to include("incidence 1")
      @reservation.remove_incidence "incidence 1"
      expect(@reservation.incidences).not_to include("incidence 1")
    end

    it "should be able to edit incidence" do
      @reservation.add_incidence "incidence 1"
      expect(@reservation.incidences).to include("incidence 1")
      @reservation.edit_incidence old_incidences: "incidence 1", new_incidence: "incidence 99"
      expect(@reservation.incidences).to include("incidence 99")
    end
  end
end
