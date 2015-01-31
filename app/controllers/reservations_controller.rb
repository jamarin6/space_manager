class ReservationsController < ApplicationController
	before_filter :authenticate_user!

	def new
		space = Space.find(params[:space_id])
		@reservation = space.reservations.build(:date => (params[:date]), :hour => (params[:hour]))
	end

	def create
		@space = Space.find(params[:space_id])
		@space.reservations.create reservation_params
		if params[:reservation][:date] == Date.today   # con params xq @day no es visible aqui
			redirect_to spaces_path
		else
			redirect_to spaces_path(:date => params[:reservation][:date])
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
		#if @reservation.incidences == nil
		#
		#else
		#
		#end
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

	def show
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		if @reservation.update_attributes(reservation_params)
			#redirect_to reservations_incidences_path
			redirect_to space_reservation_path(:space_id => @reservation.space_id, :id => @reservation.id)
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@date_destroy = @reservation.date
		@reservation.destroy
		redirect_to spaces_path(:date => @date_destroy)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:customer, :space_id, :hour, :date, :incidences)
	end
end
