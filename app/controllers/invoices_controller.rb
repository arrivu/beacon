class InvoicesController < ApplicationController

	def invoice_pdf
		@course = Course.find(params[:id].to_i)
		@price  = Course.course_price(@course)
		@user = current_user
		invoice = Payday::Invoice.new(:invoice_number => 12)
		invoice.bill_to = current_user.try(:name) if current_user
		invoice.notes = "Thank you for your purchase!"
		#invoice.tax_rate = 10
		invoice.line_items << LineItem.new(:price => @price , :quantity => 1, :description =>  @course.title )
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
		invoice_id = Invoice.create(:total=>120)
		LineItem.create(:invoice_id =>invoice_id.id )
		UserMailer.delay(:queue => 'tracking').course_payment(@user,@course,@price)    
  end
end
