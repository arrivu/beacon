class ChangeColumnYearTypeCertifiedProgramUser < ActiveRecord::Migration
 def up
  	change_column :certified_program_users, :pg_year, :text
  	change_column :certified_program_users, :gr_year, :text
  	change_column :certified_program_users, :hsc_year,:text
  	change_column :certified_program_users, :sc_year, :text
  end

  def down
    change_column :certified_program_users, :pg_year, :integer
  	change_column :certified_program_users, :gr_year, :integer
  	change_column :certified_program_users, :hsc_year, :integer
  	change_column :certified_program_users, :sc_year, :integer
  end
end
