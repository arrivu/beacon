class CoursePreviewstoaccount < ActiveRecord::Migration
 
  def change
  	add_column :course_previews, :account_id, :string
  end
end
