module InvoicesHelper

	def invoices_data(course,price)	
	debugger	
		user = current_user
		tax_rate = tax_rate_for_today
		invoice = Invoice.new
		invoice.user = user
		invoice.course = course		
    invoice.bill_to = user.name    
    
    invoice.coupon_rate = nil
    invoice.coupon_description =  nil

    invoice.tax_rate =10 # tax_rate.factor
    #invoice.tax_description = @tax_rate.description
    
    invoice.paid_at = Date.today
    invoice.currency = Payday::Config.default.currency 
    #invoice.invoice_details = 
    invoice.invoice_number = nil
    invoice.notes = "#{Settings.invoices.notes}"
		invoice.bill_to = current_user.try(:name) if current_user
		invoice.line_items << LineItem.new(:price => price , :quantity => 1, :description =>  course.title )
		invoice.line_items << LineItem.new(:price => price , :quantity => 1, :description =>  course.title )
		invoice.line_items << LineItem.new(:price => price , :quantity => 1, :description =>  course.title )
		invoice.save
		return invoice
  end

  

end
