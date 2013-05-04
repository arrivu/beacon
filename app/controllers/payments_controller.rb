class PaymentsController < ApplicationController
	before_filter :signed_in_user
  before_filter :usercheck
  
	include InvoicesHelper
  include LmsHelper

  # called this when we click on enroll button
  def course_payment
   
    session[:payment_completed]=nil
    @user = current_user
    @course = Course.find(params[:id]) 
    @price = Course.course_price(@course)
    @tax = Course.tax_calculation(@course,@price)
    if @price.to_i == 0     
     enroll_student(@course, current_user)
     redirect_to :back
   end
 end

 def follow_course

  if current_user.student != nil
    @course = Course.find(params[:id])

    @status_check = StudentCourse.find_by_student_id_and_course_id(current_user.student.id,@course.id)
    if @status_check==nil
      student_course=StudentCourse.new
      student_course.course_id=@course.id
      student_course.status="follow"
      student_course.student_id=current_user.student.id
      student_course.save 
    else
      if @status_check.status!="follow"
        student_course=StudentCourse.new
        student_course.course_id=@course.id
        student_course.status="follow"
        student_course.student_id=current_user.student.id
        student_course.save
      end
    end
    
  end
    #redirect_to :back    
  end


  # called after course_payment and in this logic for  coupon code calculation, tax calculation, and final price display for user   
  def course_payment_gateway
    @course = Course.find(params[:id])
   
  
 if  StudentCourse.where("student_id=? and course_id=? and status=?",current_user.student.id,@course.id,"enroll").empty?
  	

    @price = price_of_course_according_to_date(@course)
  	@user = current_user
  	@coupon_code = params[:coupon_code] if !params[:coupon_code].blank?
  	coupon_calc = {}
  	redirect_req = false
  	if @coupon_code && ! @coupon_code.empty?		
  		begin					
  			coupon_calc = Coupon.apply(@coupon_code, @price, current_user.id, @course.id)
  		rescue CouponNotFound
  			flash[:error] =  "Coupon not found" 
  			redirect_req =true
  		rescue CouponNotApplicable
  			flash[:error] = "Coupon does not apply"
  			redirect_req =true
  		rescue CouponRanOut
  			flash[:error] =  "Coupon has run out"
  			redirect_req =true
  		rescue CouponExpired
  			flash[:error] = "Coupon has expired"
  			redirect_req =true			
  		rescue CouponAlreadyRedeemedByUser
  			flash[:error] = "Coupon already used"
  			redirect_req =true 
      rescue CouponNotValid
        flash[:error] = "Coupon not Valid"
        redirect_req =true 
      end		
    else
      coupon_calc = Coupon.no_coupon(@price)
    end

    if redirect_req
      redirect_to :back
    else
      respond_to do |format|
       format.html do				
        @tax = Course.tax_calculation(@course,coupon_calc[:grand_total])
        @grand_total = @tax + coupon_calc[:grand_total]
        @coupon_price = coupon_calc[:grand_total]
        if coupon_calc[:coupon_des].present? && coupon_calc[:coupon_rate].present?
         @coupon_des =  coupon_calc[:coupon_des]
         @coupon_rate =  coupon_calc[:coupon_rate]
       else
         @coupon_des = nil
         @coupon_rate = 0.0
       end	
       session[:coupon_code]=@coupon_code			
       session[:coupon_des]=@coupon_des      
       session[:coupon_rate]=@coupon_rate      
       session[:coupon_price]=@price- @coupon_price 
       session[:course_price]=@grand_total
     end
   end

 end
 else
 flash[:notice] = "You have already enrolled for this course " 
 redirect_to course_path(@course)
end
 
     
end

  # called after payment_getway method in this save invoice data and generate pdf using payday and  enter the coupon code
  # entry on redeem table if coupon present
  def confirm_course_payment
   
    
    tx_id = 123456789 # default tax_id we need to changes after latter
    @course = Course.find(params[:id])
    @price = Course.course_price(@course)
    @discount=session[:coupon_price].to_f
    @subtotal=@price - @discount
    @tax = Course.tax_calculation(@course,@subtotal)
    @user = current_user
    if session[:payment_completed] ==nil
      if params[:coupon_code].present?
       @coupon = Coupon.find_coupon(params[:coupon_code], user_id = current_user.id, metadata=@course.id)
       Coupon.redeem(params[:coupon_code], @user.id, tx_id, @coupon.metadata)
     end

     enroll_student(@course, current_user)
     invoice = invoices_data(@course, params)
     invoice_generate_pdf(@course, params)			
     session[:payment_completed]=true
   end

 end


  # call this method for when some one click on download invoice link  
  def invoice_pdf
   
    @course = Course.find(params[:id])
    @user = current_user
    path = "#{Rails.root}/tmp/invoice_course_id_#{@course.id}_user_id_#{@user.id}.pdf"
    send_data File.read(path),:filename => "invoice.pdf",:type => "application/pdf"
    UserMailer.delay(:queue => 'tracking').course_payment(@user, @course, @price)
  
  
  end 

	# it is dummy method it contain the logic after return ccavanue 
  def pyment_logic
		# @notification = ActiveMerchant::Billing::Integrations::Ccavenue::Notification.new(request.raw_post)
		#  if @notification.payment_id.present?
		# 	@order = Course.find_by_order_id(@notification.payment_id)
		# 	if @notification.complete? and @notification.valid?
		# 		@order.confirm!
		# 	else
		# 	 @order.reject!
		# 	end
		#  end
	end


  private 
  def enroll_student (course, user)
    student_course=StudentCourse.new
    student_course.course_id=course.id
    student_course.status="enroll"
    student_course.student_id= user.student.id
    student_course.save
    lms_enroll_student(course.lms_id, user.lms_id)
  end
  
end
