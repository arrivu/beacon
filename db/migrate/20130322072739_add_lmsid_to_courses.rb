class AddLmsidToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :lms_id, :integer
  end
end
