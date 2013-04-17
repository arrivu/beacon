module ApplicationHelper
		# Returns the full title on a per-page basis.
		def full_title(page_title)
			base_title = "Beacon Learning"
			@page_title = page_title
			if page_title.empty?
				base_title
			else
				"#{base_title} | #{page_title}"
			end
		end

		def check_null(str)
			if str.empty?
				true
			else
				false
			end
		end

		def display_base_errors resource
			return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
			messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
			html = <<-HTML
			<div class="alert alert-error alert-block">
				<button type="button" class="close" data-dismiss="alert">&#215;</button>
				#{messages}
			</div>
			HTML
			html.html_safe
		end
		def invoices(course,price)		
		user = current_user
		tax_rate = tax_rate_for_today
		invoice = Invoice.new
		invoice.user = user
		invoice.course = course		
    invoice.bill_to = user.name    
    
    invoice.coupon_rate = nil
    invoice.coupon_description =  nil

    invoice.tax_rate = tax_rate.factor
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
