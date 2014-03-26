class SpacesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@spaces = current_user.spaces
	end

	def incidences
		pusts "XXXXXXXXXX"
	end
end