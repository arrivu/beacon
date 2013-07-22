class TeachingStaffstoaccount < ActiveRecord::Migration
  
  def change
  	add_column :teaching_staffs, :accountid, :string
  end
end
