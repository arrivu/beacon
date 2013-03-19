class AddIndexToTutorialsTitleAuthor < ActiveRecord::Migration
  def change
  	add_index :tutorials, [:title, :author], unique: true
  end
end
