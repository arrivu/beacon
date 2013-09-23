class ChangeColumnMobileCertifiedProgramUser < ActiveRecord::Migration
   def up
  	change_column :certified_program_users, :mobile, :bigint
  end

  def down
  	change_column :certified_program_users, :mobile, :integer
  end
end
