class Footerlinksaddaccountid < ActiveRecord::Migration
  def change
  	add_column :footerlinks, :accountid, :string
  	add_column  :footerlinks, :copywrite, :string
  end
end
