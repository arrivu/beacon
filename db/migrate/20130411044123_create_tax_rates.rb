class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.datetime :valid_from, :null => false
      t.datetime :valid_until
      t.decimal :factor, :precision => 6, :scale => 6
      t.boolean :is_default

      t.timestamps
    end
  end
end
