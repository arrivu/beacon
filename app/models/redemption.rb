class Redemption < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :coupon, :counter_cache => true
  validates :coupon_id, :presence => true
end
