class ReservationsController < ApplicationController
	def incidences
		@reservations = Reservation.all
	end

	def delete_incidence
		@reservation = Reservation.find(params[:id])
		@reservation.incidences = ""
		@reservation.save
		redirect_to reservations_incidences_path
	end

	def create_incidence
		@reservation = Reservation.find(params[:id])

		
	end

	def update
		
	end

	def show
		@reservations = Reservation.all
	end
end
