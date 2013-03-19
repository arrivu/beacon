# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  author       :string(255)
#  image        :string(255)
#  desc         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  ispublished  :integer          default(0)
#  releasemonth :string(255)      default("December")
#

class Course < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :author, :desc, :image, :title, :topic_ids, :user_id, :ispublished, :releasemonth
  has_many :relationships
  has_many :topics, through: :relationships
  has_many :student_courses
  has_many :students, :through => :student_courses
  has_many :teaching_staff_courses 
  has_many :teaching_staffs, :through => :teaching_staff_courses 
  
  belongs_to :user
  has_one  :rating_cache
  belongs_to :user
  letsrate_rateable "rate"

  has_one :course_status
  has_many :course_payments

  #before_save { |course| course.category = category.downcase }

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { maximum: 100 }
  validates :desc, presence: true, length: { maximum: 1000 }

  default_scope order: 'courses.created_at DESC'
end
