class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :author
      t.string :category
      t.string :image
      t.text :desc

      t.timestamps
    end
    # add_index :relationships, :course_id
    # add_index :relationships, :topic_id
  end
end
