class CreateCoursePricings < ActiveRecord::Migration
  def change
    create_table :course_pricings do |t|
      t.integer :course_id
      t.float :price
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
