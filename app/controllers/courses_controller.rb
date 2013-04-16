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


def course_payment
  @user = current_user
  @course = Course.find(params[:id])
  @price = Course.course_price(@course)
  @tax = Course.tax_calculation(@course,@price)
   #@coupon = Coupon.find_by_metadata(params[:id])
    #@a = Coupon.apply(@coupon.alpha_code,@course)
  end

  def course_payment_gateway
   @course = Course.find(params[:id])
   @coupon_code = Coupon.where(:coupon_obj_id => params[:id])
    #@aa = Coupon.apply(@coupon_code,Course.all)
  end



  def confirm_course_payment
    @course = Course.find(7)
    @user =User.first
  #UserMailer.course_payment(@user,@course,params[:price]).deliver
  # @course = Course.find(params[:id].to_i)
  # if current_user.present?

# @user = current_user
# UserMailer.course_payment(@user,@course.title,params[:price]).deliver
  # else
  # flash[:notice] = "You need to sign in or sign up before continuing."
  # redirect_to @course
    # end
   # @notification = ActiveMerchant::Billing::Integrations::Ccavenue::Notification.new(request.raw_post)
    # if @notification.payment_id.present?
    # @order = Course.find_by_order_id(@notification.payment_id)
    # if @notification.complete? and @notification.valid?
    # @order.confirm!
    # else
    # @order.reject!
    # end
  end

  def index_pdf
    @course = Course.find(params[:id].to_i)
    @price = Course.course_price(@course)
    @user = current_user
    invoice = Payday::Invoice.new(:invoice_number => 12)
    invoice.bill_to = current_user.try(:name) if current_user
    invoice.notes = "Thank you for your purchase!"
    #invoice.tax_rate = 10


    invoice.line_items << LineItem.new(:price => @price , :quantity => 1, :description => @course.title )
    # invoice.render_pdf_to_file("/path/to_file.pdf")
    # @user = User.first
    # render :pdf => "my_pdf",:layout => false,:template => '/courses/index_pdf',:footer => {:center =>"Center", :left => "Left", :right => "Right"}
    Payday::Config.default.invoice_logo = "#{Rails.root}/public/images/beaconslogo.png"
    Payday::Config.default.company_name = "Beacon Higher\nEducation Services\n Private Limited"
    Payday::Config.default.company_details = "Gurgaon, Haryana - 122016"
    Payday::Config.default.currency = "INR"
    respond_to do |format|
      format.pdf do
        @pdf = send_data invoice.render_pdf, :filename => "Invoice.pdf", :type => "application/pdf", :disposition => "inline"
      end
    end

    directory = "#{Rails.root}/tmp"
    name = "invoice_no_#{invoice.invoice_number}_course_id_#{@course.id}_user_id_#{current_user.id}.pdf"
    path = File.join(directory, name)
    #File.open(path, "wb") { |f| f.write(@pdf.read) }
    File.open("#{directory}/#{name}", "wb") do |f|
      @pdf.each do |row| f << row end
      end
    end


    def manage_courses
      @courses = Course.paginate(page: params[:page], :per_page => 10).order(:id)
      @topic = Topic.all
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
      @courses = Course.where(ispopular: 1).paginate(page: params[:page], per_page: 6)
      @topics = Topic.order(:name)
    end

    def datewise_courses
      @total_course_count = Course.all.count
      @countCoursesPerPage = 6
      @courses = Course.order(:created_at).paginate(page: params[:page], per_page: 6)
      @topics = Topic.order(:name)
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

end
