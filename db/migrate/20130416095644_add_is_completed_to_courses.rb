class AddIsCompletedToCourses < ActiveRecord::Migration
  def change
  	change_table :courses do |t|
    t.boolean :iscompleted
    t.string :completedreview
    t.date :completed
  end
  end
end
