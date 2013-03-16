class AddDescToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :desc, :string
  end
end
