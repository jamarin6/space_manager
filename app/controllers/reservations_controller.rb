class ReservationsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@reservations = Reservation.where(space_id: params[:space_id])
	end
	def new
		space = Space.find(params[:space_id])
		@reservation = space.reservations.build(:date => (params[:date]), :hour => (params[:hour]))
    # @incidence = @reservation.incidences.new # esto para la vista de haml, para crear incidencia al crear reserva, local:ok producción:MAL
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
	end

	def incidences
		@incidences = Incidence.where(reservation_id: Reservation.where(space_id: current_user.spaces)).includes(reservation: :space)
    # atención al "includes", con el q cargo "reservation" y "space" en la misma query, ya q las uso en la vista
	end

	def delete_incidences_space
		@reservation = Reservation.find(params[:space_id])
		@reservation.incidences.destroy_all
		redirect_to spaces_path
	end

	# def delete_incidences_space
	# 	Space.find(params[:space_id]).empty_reservation_incidences
	# 	redirect_to spaces_path
	# end

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
