class TeachingStaff  < ActiveRecord::Base
  attr_accessible :description, :name, :qualification,:user_id
  scope :teachers, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher")
  scope :teacher_assistants, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher_assitant")
  has_many :teaching_staff_courses
  has_many :courses, :through => :teaching_staff_courses 
end

