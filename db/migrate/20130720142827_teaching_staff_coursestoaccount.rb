class TeachingStaffCoursestoaccount < ActiveRecord::Migration
  
  def change
    add_column :teaching_staff_courses, :accountid, :string
  end
end
