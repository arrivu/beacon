class AddColumnToCertified < ActiveRecord::Migration
  def change
  	add_column :certified_program_users, :gender, :string
  end
end
