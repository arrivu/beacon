class CourseStatusestoaccount < ActiveRecord::Migration
 
  def change
  	add_column :course_statuses, :account_id, :string
  end
end
