class CreatePreviews < ActiveRecord::Migration
  def change
    create_table :previews do |t|
      t.string :name
      t.text :desc
      t.string :video_url
      t.integer :sequence
      t.integer :enable

      t.timestamps
    end
  end
end
