class AddColumnAccounts < ActiveRecord::Migration
   def change
  	add_column :accounts, :clickable_courses, :boolean
  end
end
