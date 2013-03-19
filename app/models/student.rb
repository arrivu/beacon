class Student < ActiveRecord::Base
  attr_accessible :contact_no, :description, :name, :user_id
  belongs_to :user
  has_many :student_courses
  has_many :courses, :through => :student_courses
  has_one :course_status
end
# == Schema Information
#
# Table name: students
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  contact_no  :string(255)
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

