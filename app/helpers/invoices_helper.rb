module InvoicesHelper
 
	def invoices_data(course,params)
		course = course
		user = current_user
		if  !params[:coupon_rate].nil? 
			coupon = params[:coupon_rate] 
		else
			coupon = 0.0
		end
		invoice = Invoice.new
		invoice.user = user
		invoice.course = course		
    invoice.bill_to = user.try(:name)   
    
    invoice.coupon_rate = params[:coupon_rate]
    invoice.coupon_description =  params[:coupon_description]

    invoice.tax_rate = params[:tax_rate] # tax_rate.factor
    invoice.tax_description = params[:tax_description]#@tax_rate.description
    
    invoice.paid_at = Date.today
    invoice.currency = Payday::Config.default.currency 
    #invoice.invoice_details = 
    #invoice.invoice_number = 
    invoice.notes = "#{Settings.invoices.notes}"
		invoice.bill_to = 
		invoice.line_items << LineItem.new(:price => params[:price] , :quantity => 1, :description =>  course.title,:item_type=>"Course")
		invoice.line_items << LineItem.new(:price => coupon , :description =>"test",:item_type=>"Coupon")
		invoice.line_items << LineItem.new(:price => params[:tax_rate] ,  :description =>  params[:tax_description],:item_type=>"tax")
		invoice.save
  end

  def invoice_generate_pdf(course,params)
  
  	course = course
    #   if  params[:coupon_rate].present? 
		# 	coupon = params[:coupon_rate] 
		# else
		# 	coupon = 1.0
		# end
		user = current_user
		invoice = Payday::Invoice.new	
    invoice.bill_to = user.try(:name)   
    invoice.tax_rate = params[:tax_rate] # tax_rate.factor
    invoice.tax_description = "tax"#@tax_rate.description
    
    invoice.paid_at = Date.today
    invoice.currency = Payday::Config.default.currency 
    invoice.notes = "#{Settings.invoices.notes}"
		invoice.line_items << LineItem.new(:price => params[:price] , :quantity => 1, :description =>  course.title)
		#@invoice.line_items << LineItem.new(:price => coupon.to_f , :quantity => 1, :description => "test")
		#invoice.line_items << LineItem.new(:price => params[:tax_rate] ,  :description =>  params[:tax_description])
	  invoice.render_pdf_to_file("#{Rails.root}/tmp"+"/invoice_course_id_#{course.id}_user_id_#{user.id}.pdf")
  end
  

end
