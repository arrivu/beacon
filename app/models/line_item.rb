class LineItem < ActiveRecord::Base
	attr_accessible :price, :quantity, :description,:display_price,:display_quantity
  include Payday::LineItemable
  
  belongs_to :invoice
end