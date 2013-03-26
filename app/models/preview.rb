class Preview < ActiveRecord::Base
  attr_accessible :desc, :enable, :name, :sequence, :video_url, :course_id
  belongs_to :course
	validates :desc, presence: true
	validates :name, presence: true
	validates :sequence, presence: true, length: { maximum: 3 } 
	validates :course_id, presence: true
end
