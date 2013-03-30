class CoursePayment < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :price, :start_date
  belongs_to :course
end

# == Schema Information
#
# Table name: course_payments
#
#  id         :integer         not null, primary key
#  course_id  :integer
#  price      :float
#  start_date :date
#  end_date   :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

