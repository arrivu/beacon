class RenamePreviewsToCoursepreviews < ActiveRecord::Migration
  def self.up
  	 rename_table :previews, :course_previews

  end

  def self.down
  	rename_table  :course_previews,:previews
  end
end
