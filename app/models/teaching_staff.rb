class TeachingStaff < ActiveRecord::Base
	# acts_as_heir_of :user
  attr_accessible :description, :name, :qualification,:user_id
  scope :teachers, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher")
  scope :teacher_assistants, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher_assitant")
  scope :teacher
  scope :teacher_assistant
  has_many :teaching_staff_courses
  has_many :courses, :through => :teaching_staff_courses 
  belongs_to :user

  def teacher
     self.teaching_staff_courses.where(:teaching_staff_type => "teacher")
  end

  def teacher_assistant
     self.teaching_staff_courses.where(:teaching_staff_type => "teacher_assitant")
  end
end

