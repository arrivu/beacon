class AddTopicIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :topic_id, :integer
  end
end
