class AddColorToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :color, :string
  end
end
