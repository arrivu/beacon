class RenameImageDataToImageBlobUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :image_data, :image_blob
  end

end
