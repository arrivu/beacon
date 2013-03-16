class TeachingStaffCourse < ActiveRecord::Base
  attr_accessible :course_id, :teaching_staff_id, :teaching_staff_type
  belongs_to :teaching_staff
  belongs_to :course
end
