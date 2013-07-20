class CreateFooterlinks < ActiveRecord::Migration
  def change
    create_table :footerlinks do |t|
      t.string :aboutusurl
      t.string :contactusurl
      t.string :privacypolicyurl
      t.string :termsconditionurl
      t.string :twitterurl
      t.string :youtubeurl
      t.string :facebookurl
      t.string :googleurl
      t.string :linkedinurl
       
      t.timestamps
    end
  end
end
