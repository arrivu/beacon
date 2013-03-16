class AddUserIdToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :user_id, :integer
  end
end
