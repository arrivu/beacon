class Student < ActiveRecord::Base
  attr_accessible :contact_no, :description, :name,:user_id

  scope :enroll_courses, joins(:student_courses).where('student_courses.status = ?', "enroll") 
  scope :completed_courses, joins(:student_courses).where('student_courses.status = ?', "completed") 
  scope :shortlisted_courses, joins(:student_courses).where('student_courses.status = ?', "shortlisted") 
  scope :course_enroll
  scope :course_complete
  scope :course_shortlist
  has_many :student_courses

  has_many :courses, :through => :student_courses
  belongs_to :user

  def course_enroll
  	self.student_courses.where(:status => "enroll")
  end
  def course_complete
  	self.student_courses.where(:status => "completed")
  end 
   def course_shortlist
  	self.student_courses.where(:status => "shortlisted")
  end 

  has_many :courses, :through => :student_courses 
end

