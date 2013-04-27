class AddIspopularColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ispopular, :integer
  end
end
