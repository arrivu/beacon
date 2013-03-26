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

end
