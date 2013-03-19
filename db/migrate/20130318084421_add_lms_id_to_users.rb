class AddLmsIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lms_id, :integer
  end
end
