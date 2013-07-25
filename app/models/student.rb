class Student < ActiveRecord::Base
  attr_accessible :contact_no, :description, :name,:user_id,:account_id

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
    load_course("enroll")       
  end

  def course_complete
    load_course("completed")
  end 

   def course_shortlist
  	load_course("shortlisted")
  end 

  def load_course( status)
    courses_ids = []
      self.student_courses.where(:status => status).each do |course_status|
        courses_ids << course_status.course_id
      end
    Course.find(courses_ids)      
  end

  # has_many :courses, :through => :student_courses 
end

