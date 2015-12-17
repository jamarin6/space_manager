require 'rails_helper'

RSpec.describe Space, type: :model do
  
  before :each do
    @space = Space.create!(name: "spaceName")
  end

  describe "empty incidences from reservations" do
    before :each do
      @reservation = @space.reservations.create!(incidences: "this is an incidence")
    end

    it "should work" do
      expect(@space.incidences).to include(["this is an incidence"])

      @space.empty_reservation_incidences

      expect(@space.incidences).to eq([[]])
    end

    it "should return false if something went wrong" do
      allow(@reservation).to receive(:save) { false }
      expect(@space.empty_reservation_incidences).to eql(false)
    end

    it "should return true if nothing went wrong" do
      allow(@reservation).to receive(:save) { true }
      expect(@space.empty_reservation_incidences).to eql(true)
    end

    # continuar con algún test mas x aqui

  end
end
