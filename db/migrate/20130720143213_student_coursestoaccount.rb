class StudentCoursestoaccount < ActiveRecord::Migration
  
  def change
  	add_column :student_courses, :accountid, :string
  end
end
