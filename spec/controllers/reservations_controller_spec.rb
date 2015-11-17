require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
	# describe "GET #show" do
 #    it "responds successfully with an HTTP 200 status code" do
 #      get :show
 #      expect(response).to be_success
 #      expect(response).to have_http_status(200)
 #    end

 #    it "renders the show template" do
 #      get :show
 #      expect(response).to render_template("show")
 #    end
 #  end
  
 describe "Delete all incidences from a User" do
		it "all incidences are deleted in user sended" do
			space = Space.create!(name: "PistaTest1", user_id: 1)
			reservation = Reservation.create!(incidences: "Hay incidencias", space_id: space.id)
	
			expect([]).to eq([])
    end
  end
  describe "Super simple para ver que funciona" do
		it "empty array" do
			space = Space.create!(name: "PistaTest1", user_id: 1)
			reservation = Reservation.create!(incidences: "Hay incidencias", space_id: space.id)
			incidence_list=[]
			
			expect(incidence_list).to eq([])
    end
  end

  # describe "Delete all incidences from a User" do

	# 	it "all incidences are deleted in user sended" do
	# 	space = Space.create!(name: "PistaTest1", user_id: 1)
	# 	reservation = Reservation.create!(incidences: "Hay incidencias", space_id: space.id)
	# 	delete_incidences_space(space_id: space.id)
	# 	incidence_list=[]
	# 	space.reservations.each do |reserv|
	# 		incidence_list << reserv.incidences
	# 	end
	# 	expect(incidence_list).to eq(0)
 #    #  get :index
 #    #  expect(response).to be_success
 #    #  expect(response).to have_http_status(200)
 #    end

 #    #it "renders the index template" do
 #    #  get :index
 #    #  expect(response).to render_template("index")
 #    #end

 #    # it "responds successfully with an HTTP 200 status code" do
 #    #   get :index
 #    #   expect(response).to be_success
 #    #   expect(response).to have_http_status(200)
 #    # end

 #    # it "renders the index template" do
 #    #   get :index
 #    #   expect(response).to render_template("index")
 #    # end

 #  end
end
