class CreateAccountSettings < ActiveRecord::Migration
  def change
    create_table :account_settings do |t|
      t.boolean :knowledgepartners
      t.boolean :mediapartners
      t.boolean :slideshow
      t.boolean :popularspeak
      t.boolean :testimonial
      t.string :accountid

      t.timestamps
    end
  end
end
