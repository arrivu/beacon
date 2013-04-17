class Redemption < ActiveRecord::Base
  attr_accessible :transaction_id, :metadata,:user_id,:coupon_id
  belongs_to :coupon, :counter_cache => true
  validates :coupon_id, :presence => true
end
