class SiteController < ApplicationController
	def home
		@user = User.new
	end
end
