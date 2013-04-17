class Invoice < ActiveRecord::Base
  include Payday::Invoiceable
  attr_accessible :total
  has_many :line_items
<<<<<<< HEAD

  # def tax
  # if defined?(tax_rate)
  #   calculated = subtotal * tax_rate/100
  #   return 0 if calculated < 0
  #   calculated
  # else
  #   0
  # end
end
=======
end
>>>>>>> payment_hitesh
