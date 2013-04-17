class PaymentsController < ApplicationController
	before_filter :signed_in_user
	include InvoicesHelper

	def course_payment
		@user = current_user
		@course = Course.find(params[:id]) 
		@price = Course.course_price(@course)
		@tax = Course.tax_calculation(@course,@price)
	end

	def course_payment_gateway
		@course = Course.find(params[:id])
		@price = Course.course_price(@course)
		@user = current_user
		#tx_id = 11
		coupon_code = params[:coupon_code]
		response = {}
		if coupon_code && ! coupon_code.empty?		
			begin					
				response = Coupon.apply(coupon_code, @price, current_user.id, @course.id)
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
				@saving = response[:savings]
					#Coupon.redeem(coupon_code, @user.id, tx_id, coupon.metadata)				
				end
			end      
		end


	def confirm_course_payment
		@price  = params[:price]
		@course = Course.find(params[:id])
		@tax = Course.tax_calculation(@course,@price)
		@user = current_user
		invoice = invoices_data(@course,@price)
		#UserMailer.course_payment(@user,@course,params[:price]).deliver
		# @course = Course.find(params[:id].to_i)
		# if current_user.present?

		# @user = current_user
		# UserMailer.course_payment(@user,@course.title,params[:price]).deliver
		#    else
		#    	flash[:notice] = "You need to sign in or sign up before continuing."
		#    	redirect_to @course
		#         end
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
