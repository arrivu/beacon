class CreateCourseStatuses < ActiveRecord::Migration
  def change
    create_table :course_statuses do |t|
      t.integer :student_id
      t.integer :course_id
      t.string :status

      t.timestamps
    end
  end
end
