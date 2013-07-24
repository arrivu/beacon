class CoursePreviewsController < ApplicationController
before_filter :check_admin_user, :only => [:new,:create, :edit, :destroy,:index]
	def new
		@preview = CoursePreview.new	
		#@course = Course.all
	end

	def create
		@course=Course.find(params[:id])
		@preview =@course.course_previews.build(params[:course_preview])
		@account=Account.find_by_name(request.subdomain)
   		@preview.accountid=@account.id
		if @preview.save
			flash[:success] = "Preview Added Successfully."
			redirect_to course_previews_path
		else
		
		render 'new'

		end
	end

	def index
		@previews = CoursePreview.paginate(page: params[:page], :per_page => 10)
		@course = Course.all
		
	end

	def edit
		@preview= CoursePreview.find(params[:id])
		@course = Course.all
	end

	def update
		@preview = CoursePreview.find(params[:id])
		@account=Account.find_by_name(request.subdomain)
   		@preview.accountid=@account.id
		if @preview.update_attributes(params[:course_preview])
			flash[:success] = "Successfully Updated Preview."
			redirect_to course_previews_path
		else
			render :edit
		end
	end

	def destroy
		@preview = CoursePreview.find(params[:id])

		@preview.destroy

		flash[:success] = "Successfully Destroyed Preview."
		redirect_to course_previews_path
	end



end
