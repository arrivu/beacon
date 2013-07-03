class AddLinkedinProfileUrlToTeachingStaffs < ActiveRecord::Migration
  def change
    add_column :teaching_staffs, :linkedin_profile_url, :string
  end
end
