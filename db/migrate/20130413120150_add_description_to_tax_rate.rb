class AddDescriptionToTaxRate < ActiveRecord::Migration
  def change
    add_column :tax_rates, :description, :string
      end
end
