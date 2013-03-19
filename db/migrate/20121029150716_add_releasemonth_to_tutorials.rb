class AddReleasemonthToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :releasemonth, :string, default: "December"
  end
end
