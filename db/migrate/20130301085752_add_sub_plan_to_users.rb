class AddSubPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sub_plan, :string
  end
end
