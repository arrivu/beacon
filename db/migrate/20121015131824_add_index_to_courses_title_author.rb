class AddIndexToCoursesTitleAuthor < ActiveRecord::Migration
  def change
  	add_index :courses, [:title, :author], unique: true
  end
end
