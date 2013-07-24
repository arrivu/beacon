class Testimonial < ActiveRecord::Base
  validates :comment, presence: true, length: { maximum: 500 }
  attr_accessible :comment, :job, :name, :organization, :account_id
end
