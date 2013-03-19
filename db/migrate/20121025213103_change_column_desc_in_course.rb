class ChangeColumnDescInCourse < ActiveRecord::Migration
  def up
  	change_column :courses, :desc, :text
  end

  def down
  	change_column :courses, :desc, :string
  end
end
