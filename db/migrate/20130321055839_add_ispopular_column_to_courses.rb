class AddIspopularColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ispopular, :boolean
  end
end
