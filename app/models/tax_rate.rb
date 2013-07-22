class TaxRate < ActiveRecord::Base
	attr_accessible :factor, :is_default, :valid_from, :valid_until,:description,:accountid
	validates :factor, presence: true, :numericality => true
	validates :description, presence: true, length: { maximum: 30 }

	def self.tax_rate_for_today
		TaxRate.where("valid_from <=? and valid_until >= ?", Date.today,Date.today).first     
	end

end
