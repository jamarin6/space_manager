require 'rails_helper'

RSpec.describe Reservation, type: :model do
  
  before :each do
    @reservation = Reservation.create!
  end

  describe "incidences" do

    it "should be returned as an array" do
      expect(@reservation.incidences).to be_kind_of(Array)
    end
  end
end
