class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :companyname
      t.binary :image

      t.timestamps
    end
  end
end
