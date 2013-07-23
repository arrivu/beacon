class Sliderstoimage < ActiveRecord::Migration
  def change
  	add_column :sliders, :imagename, :string
  	add_column :sliders, :imagetype, :string
  	add_column :sliders, :data, :binary
  	add_column :sliders, :backgroundimagetype, :string
  end
end
