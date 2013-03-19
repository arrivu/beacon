class CreateOClasses < ActiveRecord::Migration
  def change
    create_table :o_classes do |t|
      t.string :name
      t.string :desc
      t.integer :no_of_days
      t.integer :no_of_hours_per_day
      t.date :start_date
      t.date :end_date
      t.time :start_time_of_day
      t.time :end_time_of_day
      t.integer :no_of_student_per_class

      t.timestamps
    end
  end
end
