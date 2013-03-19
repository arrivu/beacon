class AddReleasemonthToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :releasemonth, :string, default: "December"
  end
end
