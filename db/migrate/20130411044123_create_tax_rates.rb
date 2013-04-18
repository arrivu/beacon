class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.datetime :valid_from, :null => false
      t.datetime :valid_until
      t.decimal :factor, :precision => 2, :scale => 2
      t.boolean :is_default

      t.timestamps
    end
  end
end
