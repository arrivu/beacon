class Footerlinksaddaccountid < ActiveRecord::Migration
  def change
  	add_column :footerlinks, :account_id, :string
  	add_column  :footerlinks, :copy_write, :string
  end
end
