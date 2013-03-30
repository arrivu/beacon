class RenameImageToOmniImageUrlUsers < ActiveRecord::Migration
  def self.up
  	rename_column :users, :image, :omni_image_url
  end

end
