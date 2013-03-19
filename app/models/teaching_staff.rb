class TeachingStaff < ActiveRecord::Base
  attr_accessible :description, :name, :qualification, :user_id
  belongs_to :user
  has_many :teaching_staff_courses
  has_many :courses, :through => :teaching_staff_courses 
end
# == Schema Information
#
# Table name: teaching_staffs
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :string(255)
#  qualification :string(255)
#  user_id       :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

