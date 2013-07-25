class StudentCourse < ActiveRecord::Base
  attr_accessible :course_id, :student_id,:status,:account_id
  belongs_to :student
  belongs_to :course
  belongs_to :account
  
end

