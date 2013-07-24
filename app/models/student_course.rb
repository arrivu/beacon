class StudentCourse < ActiveRecord::Base
  attr_accessible :course_id, :student_id,:status,:accountid
  belongs_to :student
  belongs_to :course
  
end

