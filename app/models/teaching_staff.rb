class TeachingStaff < User
  attr_accessible :description, :name, :qualification
  has_many :teaching_staff_courses
  has_many :courses, :through => :teaching_staff_courses 
end

