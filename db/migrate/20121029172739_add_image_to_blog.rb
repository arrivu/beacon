class AddImageToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :image, :string
  end
end
