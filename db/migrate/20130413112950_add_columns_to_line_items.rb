class AddColumnsToLineItems < ActiveRecord::Migration
  def change
  	add_column :line_items, :invoice_number, :string
  	add_column :line_items, :item_type, :string
  end
end
