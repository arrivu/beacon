class Slidertochange < ActiveRecord::Migration
  # def up
  #  add_column :sliders, :data, :binary
  # end
  def down
  	remove_column :sliders, :data
  end

end
