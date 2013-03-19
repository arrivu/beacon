class CoursePayment < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :price, :start_date
  belongs_to :course
end
