class CoursesController < ApplicationController

  layout 'courses'

	before_filter :current_user, only: [:create, :edit,:update,:delete]
   ActiveMerchant::Billing::Integrations

	def show_image
		@course = Course.find(params[:id])
		send_data @course.data, :type => 'image/png', :disposition => 'inline'
	end

	def index
		@countCoursesPerPage = 4
		if params[:mycourses]=="mycourses"
		  @courses = Course.where(user_id: current_user.id).paginate(page: params[:page], per_page: 4)
        else  
        @courses = Course.paginate(page: params[:page], per_page: 4)
		end
		@topics = Topic.order(:name)

  	end

	def new
		@course = Course.new
	end


	def create
		@course = current_user.courses.build(params[:course])
		@course.user_id = current_user.id
		if @course.save
			flash[:success] = "Course added successfully!!!!"
			#LMS Course Creation
	    lms_enable=Settings.lms.enable
	    if lms_enable 
	      lmscourse=CanvasREST::Course.new
	      lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
	      c=lmscourse.create_course(Settings.lms.account_id,@course.id,@course.title,@course.desc)
	      @course.update_attributes(:lms_id => c["id"])
	    end
			redirect_to @course
		else
			render 'new'
		end
	end

	def edit
<<<<<<< HEAD
		@course= Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update_attributes(params[:course])
			#LMS Course Updation
	    lms_enable=Settings.lms.enable
	    if lms_enable 
	      lmscourse=CanvasREST::Course.new
	      lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
	      lmscourse.update_course(@course.lms_id,@course.title,@course.desc)
	    end
			redirect_to manage_courses_url, notice: "Successfully updated course."		
		else
			render :edit
		end
	end
=======
    	@course = Course.find(params[:id])
  	end

  	def update
	    @course = Course.find(params[:id])
	    if @course.update_attributes(params[:course])
	      redirect_to @course, notice: "Successfully updated topic."
	    else
	      render :edit
	    end
  	end



	# def show
	# 	@course = Course.find(params[:id])
	# 	@countCommentsPerPage = 5
	# 	@comments = @course.comments.paginate(page: params[:page], per_page: 5)
	# 	@count = @course.comments.count
	# 	@course = Course.find(params[:id])
	# end
>>>>>>> samuel

	def show
		@course = Course.find(params[:id])

		#@countCommentsPerPage = 6
		@comments = @course.comments.paginate(page: params[:page], per_page: 6)
		#@count = @course.comments.count
		if signed_in? 
			unless RatingCache.find_by_cacheable_id(@course.id) == nil
				@qty = RatingCache.find_by_cacheable_id(@course.id).qty
			end
			
			@rated = Rate.find_by_rater_id(current_user.id)
		end
		# Just to redirect, needed due to button click event
		# @courses = Course.paginate(page: params[:page], per_page: 3)
		# @topics = Topic.all
		#@courses = Course.all
	end

	def destroy
	    @course = Course.find(params[:id])
	    lms_id=@course.lms_id
	    @course.destroy
 			#LMS Course delete
	    lms_enable=Settings.lms.enable
	    if lms_enable 
	      lmscourse=CanvasREST::Course.new
	      lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
	      lmscourse.delete_course(lms_id)
	    end
	    flash[:success] = "Successfully destroyed course."
	    redirect_to manage_courses_url
  	end


  	def course_payment 
  	end


  	def confirm_course_payment
  		@notification = ActiveMerchant::Billing::Integrations::Ccavenue::Notification.new(request.raw_post)
     if @notification.payment_id.present?
      @order = Course.find_by_order_id(@notification.payment_id)
      if @notification.complete? and @notification.valid?
        @order.confirm!
      else
       @order.reject!
      end
    end
	  
  	end

  	def manage_courses
  		@courses = Course.order(:id)
  	end
end
