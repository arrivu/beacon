class TaxRatestoaccount < ActiveRecord::Migration
 
  def change
  	add_column :tax_rates, :accountid, :string
  end
end
