class SpacesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@spaces = current_user.spaces
	end

	def incidences
		pusts "XXXXXXXXXX"
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

	#def destroy
	#	@project = Project.find params[:project_id]
	#	@entry = @project.entries.find params[:id]
	#
	#	if @entry.destroy
	#	flash[:notice] = 'Project delete successfully'
	#		redirect_to project_entries_path(@project)
	#	else
	#		flash[:alert] = "Project hasn't been deleted"
	#		render 'new'
	#	end
	#end


	#def create
	#	@project = Project.find params[:project_id]
	#	@entry = @project.entries.new entry_params
	#
	#	if @entry.save
	#		flash[:notice] = 'Project created successfully'
	#		#redirect_to project_entries_path(@project.id) #action: 'index', controller: 'entries', project_id: @project.id
	#		UserMailer.entry_created(@project).deliver
	#		redirect_to project_entries_path(@project)
	#	else
	#		flash[:alert] = "Project hasn't been created"
	#		render 'new'
	#	end
	#end
end