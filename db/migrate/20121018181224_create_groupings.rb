class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
    	t.belongs_to :group
    	t.belongs_to :tutorial
      	
      t.timestamps
    end
  end
end
