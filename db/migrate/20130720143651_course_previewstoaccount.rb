class CoursePreviewstoaccount < ActiveRecord::Migration
 
  def change
  	add_column :course_previews, :accountid, :string
  end
end
