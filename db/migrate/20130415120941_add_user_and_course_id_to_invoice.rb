class AddUserAndCourseIdToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :user_id, :integer
    add_column :invoices, :course_id, :integer
  end
end
