class InvoicesController < ApplicationController

	def invoice_pdf
	invoice =  Payday::Invoice.new(:invoice_number => 12)
    invoice.line_items << LineItem.new(:price => 20, :quantity => 5, :description => "Pants" ,:item_type=>"ssss")
   invoice.line_items << LineItem.new(:price => 10, :quantity => 3, :description => "coupon")
     invoice.line_items << LineItem.new(:price => 5, :quantity => 200, :description => "tax")
# payday_invoice = Payday::Invoice.new(invoice)
# payday_invoice = invoice
  invoice.render_pdf_to_file("#{Rails.root}"+"/to_file.pdf")
		
  end

 
end

#class InvoicesController < ApplicationController

	# def invoice_pdf
	
	# @course = Course.find(7)
	# @price  = Course.course_price(@course)		
	# @user = current_user
	# @tax_rate = tax_rate_for_today

	# invoice = Payday::Invoice.new
	# #invoice.user = @user
	# #invoice.course = @course		
 #    invoice.bill_to = @user.name    
    
 #    #invoice.coupon_rate = nil
 #    #invoice.coupon_description =  nil

 #    invoice.tax_rate = 10#@tax_rate.factor
 #    #invoice.tax_description = @tax_rate.description
    
 #    invoice.paid_at = Date.today
 #    invoice.currency = Payday::Config.default.currency 
 #    #invoice.invoice_details = 
 #    invoice.invoice_number = nil
 #    invoice.notes = "#{Settings.invoices.notes}"
	# invoice.bill_to = current_user.try(:name) if current_user
	# invoice.line_items << LineItem.new(:price => @price , :quantity => 1, :description =>  @course.title )
	# invoice.line_items << LineItem.new(:price => @price , :quantity => 1, :description =>  @course.title )
	# invoice.line_items << LineItem.new(:price => @price , :quantity => 1, :description =>  @course.title )
	# #invoice.save
	# respond_to do |format|
	# 	format.pdf do
	# 	  @pdf =   send_data invoice.render_pdf, :filename => "Invoice.pdf", :disposition => "inline"
	# 	end 
	# end 
	# #  directory = "#{Rails.root}/tmp"
	# #  name = "invoice_course_id_#{@course.id}_user_id_#{@user.id}.pdf"
	# #  path = File.join(directory, name) 
	# #  File.open("#{directory}/#{name}", "wb") do |f|
	# #    @pdf.each do |row| f << row end
	# #  end
	# # UserMailer.delay(:queue => 'tracking').course_payment(@user, @course, @price)    
 #  end 
#end
