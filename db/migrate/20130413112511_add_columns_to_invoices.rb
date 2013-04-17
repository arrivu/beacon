class AddColumnsToInvoices < ActiveRecord::Migration
  def change
  	add_column :invoices, :invoice_number, :string
  	add_column :invoices, :bill_to, :string
  	add_column :invoices, :notes, :string
  	add_column :invoices, :tax_rate, :decimal
  	add_column :invoices, :tax_description, :string
  	add_column :invoices, :coupon_rate, :decimal
  	add_column :invoices, :coupon_code, :string
  	add_column :invoices, :coupon_description, :string
  	add_column :invoices, :currency, :string
  	add_column :invoices, :invoice_details, :string
  end
end
