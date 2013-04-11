class ChangeDataTypeForTaxRateValidFrom < ActiveRecord::Migration
	 def self.up
    change_table :tax_rates do |t|
      t.change :valid_from, :date
    end
  end
 
  def self.down
    change_table :tax_rates do |t|
      t.change :valid_from, :datetime
    end
  end
end
