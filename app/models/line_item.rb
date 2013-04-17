class LineItem < ActiveRecord::Base
  include Payday::LineItemable
  #item_id is the course_id or coupon_id
  #item_type is course or coupon
  attr_accessible :item_id, :item_type, :price, :quantity, :description, :display_price, :invoice_id
  belongs_to :invoice
end