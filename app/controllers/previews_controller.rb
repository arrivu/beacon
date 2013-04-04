class PreviewsController < ApplicationController
before_filter :custom_method, :only => [:new,:create, :edit, :destroy,:index]
	def new
		@preview = Preview.new	
		#@course = Course.all
	end

	def create
		@course=Course.find(params[:id])
		@preview =@course.previews.build(params[:preview])
		if @preview.save
			flash[:success] = "Preview Added Successfully."
			redirect_to previews_path
		else
		
		render 'new'

		end
	end

	def index
		@previews = Preview.paginate(page: params[:page], :per_page => 10)
		@course = Course.all
	end

	def edit
		@preview= Preview.find(params[:id])
		@course = Course.all
	end

	def update
		@preview = Preview.find(params[:id])
		if @preview.update_attributes(params[:preview])
			flash[:success] = "Successfully Updated Preview."
			redirect_to previews_path
		else
			render :edit
		end
	end

	def destroy
		@preview = Preview.find(params[:id])

		@preview.destroy

		flash[:success] = "Successfully Destroyed Preview."
		redirect_to previews_path
	end



end
