class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.binary :image
      t.binary :background_image
      t.string :header
      t.string :body_tag
      t.string :account_id

      t.timestamps
    end
  end
end
