class ChangeDataTypeForTaxRateValidUntil < ActiveRecord::Migration

change_table :tax_rates do |t|  
        t.change :valid_until, :date 
    end

 
end
