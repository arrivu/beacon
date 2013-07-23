class StudentCoursestoaccount < ActiveRecord::Migration
  
  def change
  	add_column :student_courses, :account_id, :string
  end
end
