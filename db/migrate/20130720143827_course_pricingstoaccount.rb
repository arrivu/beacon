class CoursePricingstoaccount < ActiveRecord::Migration
 
  def change
  	add_column :course_pricings, :accountid, :string
  end
end
