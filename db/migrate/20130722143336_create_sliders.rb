class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.binary :image
      t.binary :backgroundimage
      t.string :header
      t.string :bodytag
      t.string :accountid

      t.timestamps
    end
  end
end
