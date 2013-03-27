class AddShortDescToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :short_desc, :string
  end
end
