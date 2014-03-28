class ReservationsController < ApplicationController
	before_filter :authenticate_user!

	def new
		return unless current_user.owner_of? params[:space_id]
		@reservation = Reservation.new(space_id: params[:space_id], hour: params[:hour], date: params[:date])
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

	#def update
	#	if @reservation.update update_params
	#		redirect_to @reservation, notice: "#{@reservation.id_space}"
	#	else
	#		render "edit"
	#	end
	#end

	def show
		@reservations = Reservation.all
	end
end
