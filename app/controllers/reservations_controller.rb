class ReservationsController < ApplicationController
	before_filter :authenticate_user!

	def new
		space = Space.find(params[:space_id])
		@reservation = space.reservations.build(:date => (params[:date]), :hour => (params[:hour]))
	end

	def create
		@space = Space.find(params[:space_id])
		@space.reservations.create reservation_params
		redirect_to spaces_path
	end

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

	def show
		@reservation = Reservation.find(params[:id])
	end

	private
	def reservation_params
		params.require(:reservation).permit(:customer, :space_id, :hour, :date)
	end
end
