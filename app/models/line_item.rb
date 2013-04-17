class LineItem < ActiveRecord::Base
  include Payday::LineItemable
  attr_accessible :price, :quantity, :description,:display_price,:invoice_id
  belongs_to :invoice
end