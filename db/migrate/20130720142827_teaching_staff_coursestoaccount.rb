class TeachingStaffCoursestoaccount < ActiveRecord::Migration
  
  def change
    add_column :teaching_staff_courses, :account_id, :string
  end
end
