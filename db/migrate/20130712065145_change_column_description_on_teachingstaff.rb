class ChangeColumnDescriptionOnTeachingstaff < ActiveRecord::Migration
  def up
    change_column :teaching_staffs, :description, :text
  end

  def down
    change_column :teaching_staffs, :description, :string
  end
end
