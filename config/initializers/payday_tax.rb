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