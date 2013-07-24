class TeachingStaffstoaccount < ActiveRecord::Migration
  
  def change
  	add_column :teaching_staffs, :account_id, :string
  end
end
