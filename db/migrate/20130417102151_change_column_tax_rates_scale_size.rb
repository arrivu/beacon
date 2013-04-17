class ChangeColumnTaxRatesScaleSize < ActiveRecord::Migration
  def self.up
    change_table :tax_rates do |t|
      t.change :factor, :decimal, :precision => 6, :scale => 5
    end
  end
  def self.down
    change_table :tax_rates do |t|
       t.change :factor, :decimal, :precision => 6, :scale => 6
    end
  end
end
