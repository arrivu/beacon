class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.boolean :zopium_enable

      t.timestamps
    end
  end
end
