class TaxRate < ActiveRecord::Base
  attr_accessible :factor, :is_default, :valid_from, :valid_until
  validates :factor, presence: true,:numericality => true
 

end
