class Studentstoaccount < ActiveRecord::Migration
  
  def change
  	add_column :students, :accountid, :string
  end
end
