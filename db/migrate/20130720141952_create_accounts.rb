class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :organization
      t.string :contactdetails
      t.string :noofcourses
      t.string :noofusers
      t.boolean :active

      t.timestamps
    end
  end
end
