class CourseStatusestoaccount < ActiveRecord::Migration
 
  def change
  	add_column :course_statuses, :accountid, :string
  end
end
