class PaymentsController < ApplicationController
	def show_image
  	@course = Course.find(params[:id])
  	send_data @course.data, :type => @course.content_type, :disposition => 'inline'
  end

  def confirm_course_payment
		@course = Course.find(params[:id])
		@user = current_user
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
		#   @order = Course.find_by_order_id(@notification.payment_id)
		#   if @notification.complete? and @notification.valid?
		#     @order.confirm!
		#   else
		#    @order.reject!
		#   end
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
	     # @aa = Coupon.apply(@coupon_code,Course.all)
	end
end
