class ChangeColumnTypeCertifiedProgramUser < ActiveRecord::Migration
  def up
  	change_column :certified_program_users, :mobile, :text
  	change_column :certified_program_users, :landline, :text
  end

  def down
 
  	change_column :certified_program_users, :mobile, :integer
  	change_column :certified_program_users, :landline, :integer
  end
end
