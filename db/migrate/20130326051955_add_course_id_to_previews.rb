class AddCourseIdToPreviews < ActiveRecord::Migration
  def change
    add_column :previews, :course_id, :integer
  end
end
