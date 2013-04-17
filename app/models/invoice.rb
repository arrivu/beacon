class Invoice < ActiveRecord::Base
  include Payday::Invoiceable

  attr_accessible :invoice_number, :bill_to, :notes, :tax_rate, :tax_description, :coupon_code, :coupon_rate, 
                  :coupon_description, :due_at, :paid_at, :currency, :invoice_details, :total
  has_many :line_items
  belongs_to :user
  belongs_to :course

    
    # The tax rate that we're applying, as a BigDecimal
    def tax_rate=(value)
      @tax_rate = BigDecimal.new(value.to_s)
    end

    # Shipping rate
    def shipping_rate=(value)
      @shipping_rate = BigDecimal.new(value.to_s)
    end
end
