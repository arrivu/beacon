class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :description
      t.string :contact_no
      t.integer :user_id

      t.timestamps
    end
  end
end
