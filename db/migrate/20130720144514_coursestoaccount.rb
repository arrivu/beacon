class Coursestoaccount < ActiveRecord::Migration
  def change
  	add_column :courses, :accountid, :string
  end
end
