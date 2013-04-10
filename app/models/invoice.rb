class Invoice < ActiveRecord::Base
  include Payday::Invoiceable
  
  has_many :line_items

  # def tax
  # if defined?(tax_rate)
  #   calculated = subtotal * tax_rate/100
  #   return 0 if calculated < 0
  #   calculated
  # else
  #   0
  # end
end
end