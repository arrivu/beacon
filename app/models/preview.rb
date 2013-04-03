class Preview < ActiveRecord::Base
  attr_accessible :desc, :enable, :name, :sequence, :video_url, :course_id
  belongs_to :course
	validates_presence_of :desc, presence: true, length: { maximum: 50 },:message => "Description Message Nil"
	validates :name, presence: true, length: { maximum: 15 }
	validates :sequence, presence: true, :numericality => {:only_integer => true},length: { maximum: 3 } 
	validates :course_id, presence: true
end
