class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.string :question
      t.string :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :faqs
  end
end
