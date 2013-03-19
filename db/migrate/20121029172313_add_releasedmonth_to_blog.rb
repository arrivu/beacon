class AddReleasedmonthToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :releasemonth, :string, default: "December"
  end
end
