class TaxRate < ActiveRecord::Base
	attr_accessible :factor, :is_default, :valid_from, :valid_until,:description
	validates :factor, presence: true, :numericality => true
	validates :description, presence: true, length: { maximum: 30 }
end
