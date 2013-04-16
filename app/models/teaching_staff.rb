
class TeachingStaff  < ActiveRecord::Base
  attr_accessible :description, :name, :qualification,:users_attributes
  scope :teachers, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher")
  scope :teacher_assistants, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher_assitant")
  scope :teacher
  scope :teacher_assistant
  has_many :teaching_staff_courses
  has_many :courses, :through => :teaching_staff_courses 
  belongs_to :user
  accepts_nested_attributes_for :user


  def teacher
     self.teaching_staff_courses.where(:teaching_staff_type => "teacher")
  end

  def teacher_assistant
     self.teaching_staff_courses.where(:teaching_staff_type => "teacher_assitant")
  end

end

