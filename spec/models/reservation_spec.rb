require 'rails_helper'

RSpec.describe Reservation, type: :model do
  
  before :each do
    @reservation = Reservation.create!
  end

  describe "incidences" do

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

    it "when removing incidences, it should not leave trailing separators" do
      @reservation.add_incidence "incidence 1"
      @reservation.add_incidence "incidence 2"
      @reservation.add_incidence "incidence 3"
      expect(@reservation.incidences.size).to eq(3)
      @reservation.remove_incidence "incidence 2"
      expect(@reservation.incidences.size).to eq(2)
    end

    it "should be able to edit incidence" do
      @reservation.add_incidence "incidence 1"
      expect(@reservation.incidences).to include("incidence 1")
      @reservation.edit_incidence "incidence 1", "incidence 99"
      expect(@reservation.incidences).not_to include("incidence 1")
      expect(@reservation.incidences).to include("incidence 99")
    end

    it "should be able to replace incidences by another array" do 
      @reservation.add_incidence "incidence 1"
      @reservation.add_incidence "incidence 2"
      @reservation.add_incidence "incidence 3"
      expect(@reservation.incidences.size).to eq(3)
      @reservation.incidences = %w( foo bar baz meh poh )
      expect(@reservation.incidences.size).to eq(5)
      expect(@reservation.incidences).to include("foo")
      expect(@reservation.incidences).to include("bar")
      expect(@reservation.incidences).to include("baz")
      expect(@reservation.incidences).to include("meh")
      expect(@reservation.incidences).to include("poh")
    end

  end
end
