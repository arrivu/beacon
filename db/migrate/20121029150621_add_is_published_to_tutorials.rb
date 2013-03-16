class AddIsPublishedToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :ispublished, :integer, default: 0
  end
end
