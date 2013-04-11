class EnrollsController < ApplicationController

	def show_image
  	@course = Course.find(params[:id])
  	send_data @course.data, :type => @course.content_type, :disposition => 'inline'
  end

  def confirm_course_payment
		@course = Course.find(7)
		@user =User.first
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

	def index_pdf
		@course = Course.find(params[:id].to_i)
		@price  = Course.course_price(@course)
		@user = current_user
		invoice = Payday::Invoice.new(:invoice_number => 12)
		invoice.bill_to = current_user.try(:name) if current_user
		invoice.notes = "Thank you for your purchase!"
		#invoice.tax_rate = 10
		invoice.line_items << LineItem.new(:price => @price , :quantity => 1, :description =>  @course.title )
		Payday::Config.default.invoice_logo = "#{Rails.root}/public/images/beaconslogo.png"
		Payday::Config.default.company_name = "Beacon Higher\nEducation Services\n Private Limited"
		Payday::Config.default.company_details = "Gurgaon, Haryana - 122016"
		Payday::Config.default.currency = "INR"
		respond_to do |format|
			format.pdf do
			  @pdf =   send_data invoice.render_pdf, :filename => "Invoice.pdf", :type => "application/pdf", :disposition => "inline"
			end 
		end 
		directory = "#{Rails.root}/tmp"
		name = "invoice_course_id_#{@course.id}_user_id_#{current_user.id}.pdf"
		path = File.join(directory, name) 
		File.open("#{directory}/#{name}", "wb") do |f|
		  @pdf.each do |row| f << row end
		end
		UserMailer.delay(:queue => 'tracking').course_payment(@user,@course,@price)    
  
  end
end
