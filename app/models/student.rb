class Student < ActiveRecord::Base
  attr_accessible :contact_no, :description, :name, :user_id
  belongs_to :user
  has_many :student_courses
  has_many :courses, :through => :student_courses
  has_one :course_status
end
