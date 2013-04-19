class CoursesController < ApplicationController
  include LmsHelper


#before_filter :current_user, only: [:create, :edit,:update,:delete]
ActiveMerchant::Billing::Integrations
#before_filter :initialize, :only => [:create, :edit,:update,:delete]
before_filter :check_admin_user, :only => [:new,:create, :edit, :destroy,:manage_courses]

def show_image
 @course = Course.find(params[:id])
 send_data @course.data, :type => @course.content_type, :disposition => 'inline'
end

def index
 @total_course_count = Course.where(ispublished: 1).all.count
 @countCoursesPerPage = 6
 if params[:mycourses]=="mycourses"
   @courses = Course.where(user_id: current_user.id).paginate(page: params[:page], per_page: 6)
 else
   @courses = Course.where(ispublished: 1).paginate(page: params[:page], :per_page => 6)
 end
 @topics = Topic.all
end

def new
 @course = Course.new
 @topic = Topic.all
end


def create
 @course = Course.new(params[:course])
 @course.user_id = current_user.id
 
 if @course.save
   flash[:success] = "Course added successfully!!!!"
   lms_create_course(@course)
   redirect_to manage_courses_path
 else
   render 'new'
 end

end

def edit
 @course= Course.find(params[:id])
end

def update
 @course = Course.find(params[:id])
 
 if @course.update_attributes(params[:course])
   lms_update_course(@course)
   flash[:success] ="Successfully Updated Course."  
   redirect_to manage_courses_url
 else
   render :edit
 end
 
end

def show
 @course = Course.find(params[:id])
 @authors=[]
 @course.teaching_staffs.each do |teaching_staff|
   @authors << User.where(id: teaching_staff.user_id).first
 end

 if(current_user!=nil)
  student=Student.where(user_id: current_user.id).first
  @status_check = StudentCourse.find_by_student_id_and_course_id(student,@course.id)
  if @status_check!=nil
    @status=@status_check.status

  end
end



@modules=lms_get_modules(@course)
    #@countCommentsPerPage = 6
    @comments = @course.comments.paginate(page: params[:page], per_page: 6)
    #@count = @course.comments.count
    if signed_in?
      unless RatingCache.find_by_cacheable_id(@course.id) == nil
        @qty = RatingCache.find_by_cacheable_id(@course.id).qty
      end

      @rated = Rate.find_by_rater_id(current_user.id)
    end


    def upcomming_courses
      @total_course_count = Course.where(ispublished: 0).all.count
      @countCoursesPerPage = 6
      @courses = Course.where(ispublished: 0).paginate(page: params[:page], per_page: 6)
      @topics = Topic.order(:name)
    end

    def popular_courses
      @total_course_count = Course.where(ispopular: 1).all.count
      @countCoursesPerPage = 6
      @courses = Course.where(ispopular: 1,ispublished: 1).paginate(page: params[:page], per_page: 6)
      @topics = Topic.order(:name)
    end

    def datewise_courses
      @total_course_count = Course.where(ispublished: 1).all.count
      @countCoursesPerPage = 6
      @courses = Course.where(ispublished: 1).order(:created_at).paginate(page: params[:page], per_page: 6)
      @topics = Topic.order(:name)
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
    lms_delete_course(lms_id)
    flash[:success] = "Successfully destroyed course."
    redirect_to manage_courses_url
  end

  def manage_courses
    @courses = Course.paginate(page: params[:page], :per_page => 10).order(:id)
    @topic = Topic.all
  end

  def course_status_search
    if(params[:search] == nil || params[:search] == "" && params[:searchstatus]=='All')
      @coursesstauts = StudentCourse.where("status!='shortlisted'").paginate(page: params[:page], :per_page => 15)
    elsif(params[:search] != nil && params[:search] != "" && params[:searchstatus]=='All')
      @coursesstauts = StudentCourse.where("course_id=#{params[:search]}").paginate(page: params[:page], :per_page => 15)
    elsif(params[:search] != nil && params[:search] != "" && params[:searchstatus]!=nil && params[:searchstatus]!="")
      @coursesstauts = StudentCourse.where("course_id=#{params[:search]} and status='#{params[:searchstatus]}'").paginate(page: params[:page], :per_page => 15)

    elsif(params[:search] == nil || params[:search] == "" && params[:searchstatus]!=nil && params[:searchstatus]!="")
      @coursesstauts = StudentCourse.where("status='#{params[:searchstatus]}'").paginate(page: params[:page], :per_page => 15)

    else
      @coursesstauts = StudentCourse.where("status!='shortlisted'").paginate(page: params[:page], :per_page => 15)
    end
  end


  def subscribed_courses
    if !current_user.nil?
      #@total_course_count = CourseStatus.where(current_user.id).count
      #@courses = Course.where(id: CourseStatus.where(current_user.id).all).paginate(page: params[:page], per_page: 6)
    end
    @countCoursesPerPage = 6
    @topics = Topic.order(:name)
  end

  def my_courses
    @student=Student.where(user_id: current_user.id).first
    @enrolled_courses= @student.course_enroll
    @completed_courses=@student.course_complete    
  end
  def completed_courses
    @coursesstauts=StudentCourse.find(params[:id])
    
    
  end
  def updatecompleted_details

    @coursesstauts=StudentCourse.find(params[:id])

    if @coursesstauts.update_attributes(status:params[:status])

      flash[:notice] = "Successfully Updated"

      redirect_to concluded_courses_path
    else
      render concluded_courses
    end
    
  end

  def concluded_courses



  end

  def concluded_courses_update
    if(params[:search]!="")
      @course_id=Course.find(params[:search])
      if @course_id.update_attributes(iscompleted:params[:iscompleted],completedreview:params[:completedreview])
        flash[:notice] = "Course Successfully Concluded..."
        redirect_to concluded_courses_path
      else
        render :concluded_courses
      end
    else
      flash[:notice] = "Please choose a course"
      render :concluded_courses
    end
  end
end
