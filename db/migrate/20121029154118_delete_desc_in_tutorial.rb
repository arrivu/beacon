class DeleteDescInTutorial < ActiveRecord::Migration
  def up
  	remove_column :tutorials, :desc
  end
end
