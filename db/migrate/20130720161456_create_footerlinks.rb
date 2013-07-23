class CreateFooterlinks < ActiveRecord::Migration
  def change
    create_table :footerlinks do |t|
      t.string :aboutus_url
      t.string :contactus_url
      t.string :privacy_policy_url
      t.string :terms_condition_url
      t.string :twitter_url
      t.string :youtube_url
      t.string :facebook_url
      t.string :google_url
      t.string :linkedin_url
       
      t.timestamps
    end
  end
end
