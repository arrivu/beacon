class AddDescInTutorial < ActiveRecord::Migration
  def up
  	add_column :tutorials, :desc, :text
  end
end
