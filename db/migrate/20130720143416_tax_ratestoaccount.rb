class TaxRatestoaccount < ActiveRecord::Migration
 
  def change
  	add_column :tax_rates, :account_id, :string
  end
end
