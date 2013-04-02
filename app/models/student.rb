class Student < ActiveRecord::Base
  attr_accessible :contact_no, :description, :name,:user_id
  scope :enroll_courses, joins(:student_courses).where('student_courses.status = ?', "enroll") 
  scope :completed_courses, joins(:student_courses).where('student_courses.status = ?', "completed") 
  scope :shortlisted_courses, joins(:student_courses).where('student_courses.status = ?', "shortlisted") 
  has_many :student_courses
  has_many :courses, :through => :student_courses
 
end

