class AddFieldToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :course_check_box, :boolean,:default => true
    add_column :coupons, :coupon_obj, :string
    add_column :coupons, :coupon_obj_id, :integer
    add_column :coupons, :coupon_obj_email, :string
  end
end
