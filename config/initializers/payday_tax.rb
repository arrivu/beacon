Payday::Invoiceable.class_eval do
	def tax
		if defined?(tax_rate)
			calculated = subtotal * tax_rate.to_f/100.to_f
			return 0 if calculated < 0
			calculated.round(2)
		else
			0
		end
	end   
end

Payday::PdfRenderer.class_eval do
	def self.stamp(invoice, pdf)
		stamp = nil
		if invoice.paid?
			stamp = I18n.t 'payday.status.paid', :default => "PAID"
		elsif invoice.overdue?
			stamp = I18n.t 'payday.status.overdue', :default => "OVERDUE"
		end

		if stamp
			pdf.bounding_box([150, pdf.cursor - 50], :width => pdf.bounds.width - 300) do
				pdf.font("Helvetica-Bold") do
					pdf.fill_color "cc0000"
					pdf.text stamp, :align=> :center, :size => 25, :rotate => 15
				end
			end
		end

		pdf.fill_color "000000"
	end
end
