class StudentCourse < ActiveRecord::Base
  attr_accessible :course_id, :student_id
  belongs_to :student
  belongs_to :course
end
# == Schema Information
#
# Table name: student_courses
#
#  id         :integer         not null, primary key
#  student_id :integer
#  course_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

