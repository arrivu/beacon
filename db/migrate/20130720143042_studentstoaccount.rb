class Studentstoaccount < ActiveRecord::Migration
  
  def change
  	add_column :students, :account_id, :string
  end
end
