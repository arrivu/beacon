class AddaccountidTotopics < ActiveRecord::Migration
  def change
  	add_column :topics, :accountid, :string
  end
end
