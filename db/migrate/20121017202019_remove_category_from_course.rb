class RemoveCategoryFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :category
  end

  def down
    add_column :courses, :category, :string
  end
end
