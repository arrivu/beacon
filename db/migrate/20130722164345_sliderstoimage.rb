class Sliderstoimage < ActiveRecord::Migration
  def change
  	add_column :sliders, :image_name, :string
  	add_column :sliders, :image_type, :string
  	add_column :sliders, :data, :binary
  	add_column :sliders, :background_image_type, :string
  end
end
