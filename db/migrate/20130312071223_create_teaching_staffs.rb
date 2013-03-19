class CreateTeachingStaffs < ActiveRecord::Migration
  def change
    create_table :teaching_staffs do |t|
      t.string :name
      t.string :description
      t.string :qualification
      t.integer :user_id
      
      t.timestamps
    end
  end
end
