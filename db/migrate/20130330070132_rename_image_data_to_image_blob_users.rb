class RenameImageDataToImageBlobUsers < ActiveRecord::Migration
  def self.up
  	rename_column :users, :image_data, :image_blob
  end
end
