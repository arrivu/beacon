# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
	attr_accessible :course_id, :topic_id
  belongs_to :course
  belongs_to :topic
end
