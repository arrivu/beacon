class AddIsPublishedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ispublished, :integer, default: 0
  end
end
