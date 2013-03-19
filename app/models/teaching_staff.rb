class TeachingStaff < ActiveRecord::Base
  attr_accessible :description, :name, :qualification, :user_id
  belongs_to :user
  has_many :teaching_staff_courses
  has_many :courses, :through => :teaching_staff_courses 
end
