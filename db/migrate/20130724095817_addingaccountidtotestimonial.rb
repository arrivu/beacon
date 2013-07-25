class Addingaccountidtotestimonial < ActiveRecord::Migration
  def change 
  	add_column :testimonials, :account_id, :string
  end
end
