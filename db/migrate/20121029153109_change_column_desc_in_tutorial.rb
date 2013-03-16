class ChangeColumnDescInTutorial < ActiveRecord::Migration
  def up
  	change_column :tutorials, :desc, :text
  end

  def down
  	change_column :tutorials, :desc, :string
  end
end
