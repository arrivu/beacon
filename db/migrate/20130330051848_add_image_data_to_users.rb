class AddImageDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attachment, :string
    add_column :users, :content_type, :string
    add_column :users, :image_data, :binary
  end
end
