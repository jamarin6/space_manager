class SpacesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@spaces = current_user.spaces
		@day = params[:date] ? Date.parse(params[:date]) : Date.today 
		@reserv = Reservation.where(date: @day, space_id: @spaces.map(&:id)) # reservas del día seleccionado y q sean de spaces del current_user
		@reservations = {}
		@spaces.each {|s| @reservations[s.id] = {}}  # creamos un hash vacio primero aquí, para almacenar info de reservas de forma q
		                                             # cada sala tenga otro hash de horas de reserva y estos a su vez
		                                             # tengan su id
		                                             # ej: Sala 1 = {
		                                             #                10 => 1
		                                             #                11 => 2
		                                             #	              ''   ''
		                                             # }
		@reserv.each do |r|
			@reservations[r.space_id][r.hour] = r.id # y aqui le añadimos la hora de la reserva a la sala correspondiente
		end

	end

	def new
		@space = current_user.spaces.new
	end

	def create
		@space = current_user.spaces.create entry_params
		redirect_to spaces_path	
	end

	def entry_params
		params.require(:space).permit(:name, :start_at, :end_at)
	end

	def destroy
		@space = current_user.spaces.find params[:id]
		@space.destroy
		redirect_to spaces_path
	end
end