class CourseStatus < ActiveRecord::Base
  attr_accessible :course_id, :status, :student_id
  belongs_to :course
  belongs_to :student
end

# == Schema Information
#
# Table name: course_statuses
#
#  id         :integer         not null, primary key
#  student_id :integer
#  course_id  :integer
#  status     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

