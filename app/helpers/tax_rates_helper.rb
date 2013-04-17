module TaxRatesHelper

  def tax_rate_for_today
     TaxRate.where("valid_from <=? and valid_until >= ?", Date.today,Date.today).first     
  end
end
