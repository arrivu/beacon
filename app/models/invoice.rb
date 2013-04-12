class Invoice < ActiveRecord::Base
  include Payday::Invoiceable
  attr_accessible :total
  has_many :line_items
end