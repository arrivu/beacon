class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :author
      t.string :image
      t.string :desc

      t.timestamps
    end
    # add_index :groupings, :group_id
    # add_index :groupings, :tutorial_id
  end

end
