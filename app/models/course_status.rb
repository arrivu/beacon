class CourseStatus < ActiveRecord::Base
  attr_accessible :course_id, :status, :student_id
  belongs_to :course
  belongs_to :student
end
