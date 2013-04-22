module InvoicesHelper
    
	def invoices_data(course, params)
		course = course
    price = price_of_course_according_to_date(@course)
		user = current_user		
		invoice = Invoice.new
		invoice.user = user
		invoice.course = course		
    invoice.bill_to = user.try(:name)   
    invoice.coupon_rate = session[:coupon_rate]
    invoice.coupon_description = session[:coupon_des]
    tax=tax_rate_for_today
    invoice.tax_rate = tax.factor#params[:tax_rate] # tax_rate.factor
    invoice.tax_description = tax.description#params[:tax_description]#@tax_rate.description
    
    invoice.paid_at = Date.today
    invoice.currency = Payday::Config.default.currency 
    #invoice.invoice_details = 
    #invoice.invoice_number = 
    invoice.notes = "#{Settings.invoices.notes}"
    invoice.line_items << LineItem.new(:price => price , :quantity => 1, :description =>  course.title,:item_type=>"Course")
    if session[:coupon_rate].to_i != 0
        invoice.line_items << LineItem.new(:price => -(session[:coupon_price].to_f), :quantity => 1, :description =>session[:coupon_des],:item_type=>"Coupon")
    end
		#invoice.line_items << LineItem.new(:price => params[:tax_rate] ,  :description =>  params[:tax_description],:item_type=>"tax")
		invoice.save
  end

  def invoice_generate_pdf(course,params)
  	course = course
    price = price_of_course_according_to_date(@course)
    user = current_user
    invoice = Payday::Invoice.new	
    invoice.bill_to = user.try(:name) 
    tax = tax_rate_for_today  
    invoice.tax_rate = tax.factor#params[:tax_rate] 
    invoice.tax_description = tax.description#'Tax'    
    invoice.paid_at = Date.today
    invoice.currency = Payday::Config.default.currency 
    invoice.notes = "#{Settings.invoices.notes}"
    invoice.line_items << LineItem.new(:price => price , :quantity => 1, :description =>  course.title)
    if session[:coupon_rate].to_i != 0
      invoice.line_items << LineItem.new(:price => -(session[:coupon_price].to_f), :quantity => 1, :description =>session[:coupon_des])
    end
      #invoice.line_items << LineItem.new(:price => params[:tax_rate] ,:quantity => 1,  :description =>  params[:tax_description])
      invoice.render_pdf_to_file("#{Rails.root}/tmp"+"/invoice_course_id_#{course.id}_user_id_#{user.id}.pdf")
   end
 end
