class CreateAccountSettings < ActiveRecord::Migration
  def change
    create_table :account_settings do |t|
      t.boolean :knowledge_partners
      t.boolean :media_partners
      t.boolean :slide_show
      t.boolean :popular_speak
      t.boolean :testimonial
      t.string :account_id

      t.timestamps
    end
  end
end
