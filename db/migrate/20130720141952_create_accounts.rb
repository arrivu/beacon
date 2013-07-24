class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :organization
      t.string :no_of_courses
      t.string :no_of_users
      t.string :support_script
      t.string :google_analytics_script
      t.boolean :active
      t.timestamps
    end
    
  end
end
