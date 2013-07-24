class Coursestoaccount < ActiveRecord::Migration
  def change
  	add_column :courses, :account_id, :string
  end
end
