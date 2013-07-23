class CoursePricingstoaccount < ActiveRecord::Migration
 
  def change
  	add_column :course_pricings, :account_id, :string
  end
end
