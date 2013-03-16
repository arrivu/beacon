class AddIspublishedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :ispublished, :integer, default: 0
  end
end
