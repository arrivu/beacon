class ChangeDataTypeForCoursesIspopular < ActiveRecord::Migration
	change_table :courses do |t|  
		t.change :ispopular, :integer 
	end
end
