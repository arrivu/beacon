class StudentCourse < ActiveRecord::Base
  attr_accessible :course_id, :student_id
  belongs_to :student
  belongs_to :course
end
