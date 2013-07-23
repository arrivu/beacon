class CreateAccountUsers < ActiveRecord::Migration
  def change
    create_table :account_users do |t|
      t.string :account_id
      t.string :user_id
      t.string :membership_type
      t.timestamps

    end
  end
end
