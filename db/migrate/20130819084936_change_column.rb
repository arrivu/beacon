class ChangeColumn < ActiveRecord::Migration
   def up
    change_column :course_previews, :video_url, :text
  end

  def down
    change_column :course_previews, :video_url, :string
  end
end
