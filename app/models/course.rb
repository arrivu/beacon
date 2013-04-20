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
  attr_accessible :lms_id,:attachment,:author, :desc, :image, :title, :topic_id, :user_id, :ispublished, 
                  :releasemonth, :ispopular,:filename,:content_type,:data, :short_desc,:teaching_staff_ids,
                  :isconcluded,:concluded_review,:start_date,:end_date
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
  has_many :course_previews

  has_many :invoices

  #before_save { |course| course.category = category.downcase }

  validates :desc, presence: true, length: { maximum: 1000 }
  validates  :short_desc, presence: true, length:{maximum: 100}

  default_scope order: 'courses.created_at ASC'

  def self.course_price(course)
    course.course_pricings.each do |course_price|
      if course_price.start_date <= Date.today && course_price.end_date >= Date.today
        @price = course_price.price
      end
    end
    return @price
  end

  def self.tax_calculation(course,price)
   tax_rate= ApplicationController.helpers.tax_rate_for_today.factor
   tax = price.to_f * (tax_rate.to_f/100.to_f)
   return tax.round(2)
 end

 def student_enrolled
  load_student("enroll")  
end

def student_completed
  load_student("completed")  
end 

def student_shortlisted
  load_student("shortlisted")
end 

  def load_student( status)
    student_ids = []
      self.student_courses.where(:status => status).each do |course_status|
        student_ids << course_status.student_id
      end
    Student.find(courses_ids)      
  end


def staff_image
    #named_scope :omni_image_url, lambda {|c| {:joins=>([:courses,:teaching_staffs,:users]):conditions=>['baz_cat=',c]}}
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
   #def self.authorimage(courseid)
  #find_by_sql("select u.image_blob,u.name from teaching_staff_courses t left join user u on t.teaching_staff_id=u.id left join course c on c.id=t.course_id
   #where c.id=#{courseid}")
  #end
  

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

  HUMANIZED_ATTRIBUTES = {
    :short_desc => "Short Description",
    :desc => "Description"
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
