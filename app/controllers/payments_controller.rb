class PaymentsController < ApplicationController
	before_filter :signed_in_user
	include InvoicesHelper
	
  # called this when we click on enroll button
	def course_payment
		@user = current_user
		@course = Course.find(params[:id]) 
		@price = Course.course_price(@course)
		@tax = Course.tax_calculation(@course,@price)
	end


  # called after course_payment and in this logic for  coupon code calculation, tax calculation, and final price display for user   
	def course_payment_gateway
		@course = Course.find(params[:id])
		@price = Course.course_price(@course)
		@user = current_user
		@coupon_code = params[:coupon_code] if !params[:coupon_code].blank?
		response = {}
		if @coupon_code && ! @coupon_code.empty?		
			begin					
				response = Coupon.apply(@coupon_code, @price, current_user.id, @course.id)
			rescue CouponNotFound
				flash[:notice] =  "Coupon not found" 
				redirect_to :back
			rescue CouponNotApplicable
				flash[:notice] = "Coupon does not apply"
				redirect_to :back
			rescue CouponRanOut
				flash[:notice] =  "Coupon has run out"
				redirect_to :back
			rescue CouponExpired
				flash[:notice] = "Coupon has expired"
				redirect_to :back
			end
		else
			response = Coupon.no_coupon(@price)
		end
		respond_to do |format|
			format.html do
		    @tax = Course.tax_calculation(@course,response[:grand_total])
				@grand_total = @tax + response[:grand_total]
				@coupon_price = response[:grand_total]
				if response[:coupon_des].present? && response[:coupon_rate].present?
				  @coupon_des =  response[:coupon_des]
				  @coupon_rate =  response[:coupon_rate]
				else
					@coupon_des = nil
					@coupon_rate = 0.0
				end					
				end
			end      
		end

  # called after payment_getway method in this save invoice data and generate pdf using payday and  enter the coupon code
  # entry on redeem table if coupon present
	def confirm_course_payment
		tx_id = 123456789 # default tax_id we need to changes after latter
		@course = Course.find(params[:id])
		@price = Course.course_price(@course)
		@tax = Course.tax_calculation(@course,@price)
		@user = current_user
		invoice = invoices_data(@course,params)
		invoice_generate_pdf(@course,params)
		if params[:coupon_code].present?
		 @coupon = Coupon.find_coupon(params[:coupon_code], user_id = nil, metadata=nil)
		 Coupon.redeem(params[:coupon_code], @user.id, tx_id, @coupon.metadata)
	  end
		
	end

  # call this method for when some one click on download invoice link  
	def invoice_pdf
		@course = Course.find(params[:id])
		@user = current_user
	  path = "#{Rails.root}/tmp/invoice_course_id_#{@course.id}_user_id_#{@user.id}.pdf"
		send_data File.read(path)
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
end
