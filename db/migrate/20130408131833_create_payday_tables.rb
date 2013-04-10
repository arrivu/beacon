class CreatePaydayTables < ActiveRecord::Migration
  def self.up
      create_table :invoices do |t|
      t.date :due_at
      t.date :paid_at
      
      t.decimal :total
      
      t.string :company_name
      
      t.timestamps
    end

    create_table :line_items do |t|
      t.decimal :price
      t.string :description
      t.integer :quantity
      t.integer :display_price
      t.integer :display_quantity
      t.integer :invoice_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :invoices
    drop_table :line_items
  end
end