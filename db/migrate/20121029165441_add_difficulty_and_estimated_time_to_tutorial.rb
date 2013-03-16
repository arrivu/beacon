class AddDifficultyAndEstimatedTimeToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :difficulty, :string
    add_column :tutorials, :estimated_time, :integer
  end
end
