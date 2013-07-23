class AddaccountidTotopics < ActiveRecord::Migration
  def change
  	add_column :topics, :account_id, :string
  end
end
