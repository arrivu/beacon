class TeachingStaffCourse < ActiveRecord::Base
  attr_accessible :course_id, :teaching_staff_id, :teaching_staff_type
  belongs_to :teaching_staff
  belongs_to :course
end
# == Schema Information
#
# Table name: teaching_staff_courses
#
#  id                  :integer         not null, primary key
#  course_id           :integer
#  teaching_staff_id   :integer
#  teaching_staff_type :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

