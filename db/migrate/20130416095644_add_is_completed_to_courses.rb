class AddIsCompletedToCourses < ActiveRecord::Migration
  def change
  	change_table :courses do |t|
    t.boolean :isconcluded
    t.string :concluded_review
    t.date :concluded
  end
  end
end
