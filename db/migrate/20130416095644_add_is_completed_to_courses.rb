class AddIsCompletedToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :isconcluded, :boolean
  	add_column :courses, :concluded_review, :string
  	add_column :courses, :concluded, :date
  end
end
