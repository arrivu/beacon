class AddBackgroundImageToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :background_image, :binary
    add_column :courses, :background_image_type, :string
  end
end
