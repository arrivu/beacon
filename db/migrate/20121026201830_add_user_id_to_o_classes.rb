class AddUserIdToOClasses < ActiveRecord::Migration
  def change
    add_column :o_classes, :user_id, :integer
  end
end
