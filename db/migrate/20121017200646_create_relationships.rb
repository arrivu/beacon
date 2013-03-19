class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.belongs_to :course
      	t.belongs_to :topic
      	t.timestamps
    end
  end
end
