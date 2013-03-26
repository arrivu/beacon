class PreviewsController < ApplicationController

	def new
		@preview = Preview.new	
		@course = Course.all
	end

	def create
		@preview =Preview.new(params[:preview])
		if @preview.save
			flash[:success] = "preview added successfully!!!!"
			redirect_to new_preview_path
		else
			flash[:error] = "Error while adding Preview "
			redirect_to new_preview_path

		end
	end

	def index
		@previews = Preview.order(:course_id)
	end

	def edit
		@preview= Preview.find(params[:id])
		@course = Course.all
	end

	def update
		@preview = Preview.find(params[:id])
		if @preview.update_attributes(params[:preview])

			redirect_to previews_path, notice: "Successfully updated preview."		
		else
			render :edit
		end
	end

	def destroy
		@preview = Preview.find(params[:id])

		@preview.destroy

		flash[:success] = "Successfully destroyed preview."
		redirect_to previews_path
	end


end
