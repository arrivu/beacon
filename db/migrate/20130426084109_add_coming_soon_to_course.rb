class AddComingSoonToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :is_coming_soon, :boolean
  end
end
