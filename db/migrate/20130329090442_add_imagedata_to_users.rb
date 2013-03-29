class AddImagedataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :filename, :string
    add_column :users, :content_type, :string
  end
end
