class Action < ActiveRecord::Base
  include Payday::LineItemable
  
  belongs_to :bill
end