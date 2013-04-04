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

  self.per_page = 6
  acts_as_commentable
  attr_accessible :lms_id,:attachment,:author, :desc, :image, :title, :topic_id, :user_id, :ispublished, :releasemonth, :ispopular,:filename,:content_type,:data, :short_desc
  scope :teachers, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher")
  scope :teacher_assistants, joins(:teaching_staff_courses).where('teaching_staff_courses.teaching_staff_type = ?', "teacher_assitant")

  #has_many :relationships
  scope :enrolled_students, joins(:student_courses).where('student_courses.status = ?', "enroll") 
  scope :completed_students, joins(:student_courses).where('student_courses.status = ?', "completed") 
  scope :shortlisted_students, joins(:student_courses).where('student_courses.status = ?', "shortlisted") 
  scope :student_enroll
  scope :student_complete
  scope :student_shortlist
  scope :teacher_course
  scope :teacher_assistant_course
  belongs_to :topic
  has_many :student_courses, :dependent =>:destroy
  has_many :students, :through => :student_courses
  has_many :teaching_staff_courses, :dependent =>:destroy
  has_many :teaching_staffs, :through => :teaching_staff_courses 
  has_many :course_coupons, :dependent =>:destroy
  has_many :coupons, :through => :course_coupons 
  has_one  :rating_cache
  belongs_to :user
  letsrate_rateable "rate"

  
  has_many :course_pricings

  #before_save { |course| course.category = category.downcase }

  validates :title, presence: true, length: { maximum: 100 }

  has_one :course_status
  #has_many :course_payments
  has_many :previews

  #before_save { |course| course.category = category.downcase }

  validates :desc, presence: true, length: { maximum: 1000 }

  default_scope order: 'courses.created_at DESC'

  def student_enroll
    self.student_courses.where(:status => "enroll")
  end
  def student_complete
    self.student_courses.where(:status => "completed")
  end 
   def student_shortlist
    self.student_courses.where(:status => "shortlisted")
  end 

  def teacher_course
     self.teaching_staff_courses.where(:teaching_staff_type => "teacher")
  end

  def teacher_assistant_course
     self.teaching_staff_courses.where(:teaching_staff_type => "teacher_assitant")
  end

  def attachment=(incoming_file)
    self.image = incoming_file.original_filename
    self.content_type = incoming_file.content_type
    self.data = incoming_file.read
  end

  def image=(new_filename)
    write_attribute("image", sanitize_filename(new_filename))
  end

  def course_price_inbetween_date
     self.course_pricings.find(:all, :conditions => "#{Date.today} >= start_date or #{Date.today} <= end_date")
  end

  private
  def sanitize_filename(filename)
    #get only the filename, not the whole path (from IE)
    just_filename = File.basename(filename)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
