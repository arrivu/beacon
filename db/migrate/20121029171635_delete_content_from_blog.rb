class DeleteContentFromBlog < ActiveRecord::Migration
  def up
  	remove_column :blogs, :content
  end
end
